package com.camp.s1.camping;

import java.util.List;

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
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return campDAO.getCampDetail(campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		//나중에 파일추가되면 파일도 삭제하는 기능 필요 - ON DELETE CASCADE 걸었음
		int result = campDAO.setCampDelete(campDTO);
		return result;
	}
	
	//add
	public int setCampAdd(CampDTO campDTO, MultipartFile[] files, HttpSession session) throws Exception{
		//캠프장 하나 추가
		int result = campDAO.setCampAdd(campDTO);
		
		//1.HDD에 file 저장('어디'에 '무슨'이름으로)
		String realPath = session.getServletContext().getRealPath("resources/upload/notice");
		System.out.println(realPath); //확인용
		
		//반복저장
		for(MultipartFile multipartFile : files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(multipartFile, realPath);
			
			//2.DB에 insert
			//객체 만들고, 이 객체에 추가할 파일 정보를 db로부터 조회해서 집어넣기
			CampFileDTO campFileDTO = new CampFileDTO();
			campFileDTO.setCampNum(campDTO.getCampNum());
			campFileDTO.setFileName(fileName);
			campFileDTO.setOriName(multipartFile.getOriginalFilename());
			
			result = campDAO.setCampFileAdd(campFileDTO);
		}
		
		return result;
	}
		
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return campDAO.setCampUpdate(campDTO);
	}
}
