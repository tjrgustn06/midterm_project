package com.camp.s1.camping;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.util.FileManager;
import com.camp.s1.util.Pager;

@Service
public class CampService {

	@Autowired
	private CampDAO campDAO;
	@Autowired
	private FileManager fileManager;
	
	//list
	public List<CampDTO> getCampList(Pager pager) throws Exception{
		//pagination
		pager.makeRow();
		Long count = campDAO.getTotalCount(pager);
		pager.makeNum(count);
		
		List<CampDTO> ar = campDAO.getCampList(pager);
		return ar;
	}
	
	//list에서 아이콘 작업을 위해 문자열을 parsing
//	public static void main(String[] ar){
//		String str="this-=string-includes=delims";
//		StringTokenizer stk=new StringTokenizer(str,"-=");
//		System.out.println(str);
//		System.out.println();
//			
//		System.out.println("total tokens:"+stk.countTokens());
//		System.out.println("================tokens==================");
//		while(stk.hasMoreTokens()){
//			System.out.println(stk.nextToken());
//		}
//		System.out.println("total tokens:"+stk.countTokens());
//	}
	public List<String> getCampServiceIcon(CampDTO campDTO) throws Exception{
		List<String> service = new ArrayList<String>();
		String str = campDAO.getCampDetail(campDTO).getService();
		StringTokenizer stk = new StringTokenizer(str, ",");
		
		while(stk.hasMoreTokens()) {
			//System.out.println(stk.nextToken());
			service.add(stk.nextToken());
		}
		return service;
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return campDAO.getCampDetail(campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO, HttpSession session) throws Exception{
		//글삭제+파일삭제 - ON DELETE CASCADE 걸었음
		List<CampFileDTO> ar = campDAO.getCampFileList(campDTO); //파일 리스트 조회
		int result = campDAO.setCampDelete(campDTO); //글삭제
		
		//나머지 글에 딸린 OS의 파일도 삭제. db에서는 cascade로 자동삭제
		if(result>0) {
			//글삭제에 성공한 경우 파일 삭제 시행(파일 경로와 이름이 필요)
			String realPath = session.getServletContext().getRealPath("resources/upload/camp");
			
			for(CampFileDTO campFileDTO : ar) {
				fileManager.fileDelete(realPath, campFileDTO.getFileName());
			}
		}
		return result;
	}
	
	//add
	public int setCampAdd(CampDTO campDTO, MultipartFile[] files, MultipartFile thumbFile, HttpSession session) throws Exception{
		//캠프장 하나 추가
		int result = campDAO.setCampAdd(campDTO);
		
		//캠프사이트 추가 - campSiteDTO의 데이터가 null이 아닌 경우에만(지금은 프론트에서 처리하긴 했는데...)
			for(CampSiteDTO campSiteDTO : campDTO.getCampSiteDTOs()) {
				if(campSiteDTO.getOffWeekdaysPrice()!=null) {
					campSiteDTO.setCampNum(campDTO.getCampNum());
					result = campDAO.setCampSiteAdd(campSiteDTO);
				}else {
					continue;
				}
			}
		
		//파일 추가 - files
		//1.HDD에 file 저장('어디'에 '무슨'이름으로)
		String realPath = session.getServletContext().getRealPath("resources/upload/camp");
		System.out.println("files: "+realPath); //확인용
		
		//반복저장
		for(MultipartFile multipartFile : files) {
			//파일이 비어있으면 continue실행. 해당 index를 건너뛰고 다음 index 반복문 시행
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			//확인용 - 파일 있으면 사이즈 나올거고 없으면 0
			System.out.println("file size: "+multipartFile.getSize());
			
			//2.DB에 insert
			//객체 만들고, 이 객체에 추가할 파일 정보를 db로부터 조회해서 집어넣기
			CampFileDTO campFileDTO = new CampFileDTO();
			campFileDTO.setCampNum(campDTO.getCampNum());
			campFileDTO.setFileName(fileName);
			campFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			//확인용
//			System.out.println("fileNum: "+campFileDTO.getFileNum());
//			System.out.println("campNum: "+campFileDTO.getCampNum());
//			System.out.println("fileName: "+campFileDTO.getFileName());
//			System.out.println("oriName: "+campFileDTO.getOriName());
					
			result = campDAO.setCampFileAdd(campFileDTO);
			
			//확인용
			System.out.println("fileNum: "+campFileDTO.getFileNum());
		}
		//files end
		
		
		//썸네일 저장 - thumbFile
		if(thumbFile.getSize()!=0) {
			//1. file을 HDD에 저장.
			String savePath = "resources/upload/camp/thumbnail";
			String thumbRealPath = session.getServletContext().getRealPath(savePath);
			System.out.println("thumbFiles: "+thumbRealPath);
			String thumbName = fileManager.fileSave(thumbFile, thumbRealPath);
			
			//2. DB에 저장
			ThumbnailDTO thumbnailDTO = new ThumbnailDTO();
			thumbnailDTO.setCampNum(campDTO.getCampNum());
			thumbnailDTO.setThumbName(thumbName);
			
			//3.CampDTO의 thumbnail 컬럼에 경로 저장(일단 보류)
			result = campDAO.setThumbnailAdd(thumbnailDTO);		
		}
		//thumbFile end
		
		return result;
	}
		
	//update
	public int setCampUpdate(CampDTO campDTO, MultipartFile[] files, HttpSession session, Long[] areaNums, Long[] fileNums) throws Exception{
		//업데이트시 적용되어야할 내용 - 1.글 내용 업데이트(CampDTO-campNum), 2.썸네일 업데이트(CampDTO-thumbnailDTO-thumbNum), 3.파일 업데이트(CampDTO-fileDTOs-fileNum), 4.사이트 업데이트(CampDTO-siteDTOs-areaNum)
		//서비스에서 처리해야할 내용
		//1.글내용 업데이트 메서드 실행, 2.썸네일 업데이트 메서드 실행, 3.파일 업데이트 메서드 실행, 4.사이트 업데이트 메서드 실행
		
		//캠프사이트 삭제 후 추가(서비스에서 areaNum을 통해 기존 db에 있는 siteDTO지우고 CampDTO에 있는 사이트 입력하게끔)
		//삭제
		for(Long areaNum : areaNums) {
			campDAO.setsitedele
		}
		
		
		
		//1.업데이트 -> 글 내용 + 업데이트 되는 파일은 2.지우고 3.다시 넣기
		//ajax로 파일처리하면 파일추가만 하면 될듯
		
		//1.
//		List<CampFileDTO> ar = campDAO.getCampFileList(campDTO); //업데이트 하기전에 캠핑장에 묶인 파일리스트 조회
//		
//		for(CampFileDTO campFileDTO : ar) { //확인용
//			System.out.println("fileNum: "+campFileDTO.getFileNum());
//		}
		
		int result = campDAO.setCampUpdate(campDTO);
		
//		//파일처리 - DB의 파일정보 지우기.
//		if(fileNums != null) {
//			for(Long fileNum : fileNums) {
//				campDAO.setCampFileDelete(fileNum);
//			}
//		}
//		
//		//2.업데이트 성공하면 파일 지우기(이름, 경로 필요) - CampDelete에서 file delete와 동일
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/camp");
//			
//			for(CampFileDTO campFileDTO : ar) {
//				fileManager.fileDelete(realPath, campFileDTO.getFileName());
//			}
//		
		//3.업데이트 성공하고 파일지우면, 새로 넣기 - CampAdd에서 file Insert와 동일
			//반복저장
			for(MultipartFile multipartFile : files) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(multipartFile, realPath);
				
				CampFileDTO campFileDTO = new CampFileDTO();
				campFileDTO.setCampNum(campDTO.getCampNum());
				campFileDTO.setFileName(fileName);
				campFileDTO.setOriName(multipartFile.getOriginalFilename());
						
				result = campDAO.setCampFileAdd(campFileDTO);
			}
		}
		return result;
	}
	
	//파일 삭제할때 필요한 FileDetail
	public CampFileDTO getCampFileDetail(CampFileDTO campFileDTO) throws Exception{
		return campDAO.getCampFileDetail(campFileDTO);
	}
	
	
	//update-Ajax(fileDelete)
	public int setCampFileDelete(Long fileNum, HttpSession session) throws Exception{
		//메서드 호출이 되면 db에서 정보삭제 + hdd에서 파일삭제(하나씩)
		System.out.println("serv: "+fileNum);
		CampFileDTO campFileDTO = new CampFileDTO();
		campFileDTO.setFileNum(fileNum);
		campFileDTO = campDAO.getCampFileDetail(campFileDTO);
		System.out.println("fileNum: "+campFileDTO.getFileName());
		
		int result = campDAO.setCampFileDelete(fileNum);
		
		if(result>0) {
			String realPath = session.getServletContext().getRealPath("resources/upload/camp");
			System.out.println(realPath);
			boolean check = fileManager.fileDelete(realPath, campFileDTO.getFileName());
			if(check) {
				result = 1;
			}else {
				result = 0;
			}
		}
		return result;
	}
	
	public List<CampDTO> getSigunguNameList(CampDTO campDTO) throws Exception {
		return campDAO.getSigunguNameList(campDTO);
	}
	
	public List<CampDTO> getSearchCampList(CampDTO campDTO) throws Exception {
		return campDAO.getSearchCampList(campDTO);
	}
}
