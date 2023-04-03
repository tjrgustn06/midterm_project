package com.camp.s1.camping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/camp/*")
public class CampController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private CampService campService;
	
	//만약에 product랑 jsp 같이 쓸거면 필요한데 안그럴거같음, 쓰게되면 수정
//	@ModelAttribute("boardName")
//	public String getBoardName() {
//		return "BankBookComment";
//	}
	
	//list
	@GetMapping("list")
	public ModelAndView getCampList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CampDTO> ar = campService.getCampList(pager);
		List<ArrayList<String>> serviceIcon = new ArrayList<ArrayList<String>>();
		
		//service 아이콘 작업을 위한 StringTokenizer 사용
		for(CampDTO campDTO : ar) {
			if(campDTO.getService()!=null) {
				ArrayList<String> service = (ArrayList<String>)(campService.getCampServiceIcon(campDTO));
//				System.out.println(service); //만든 service를 확인하고, ModelAndView에 입력
				serviceIcon.add(service);
			}
		}

		mv.addObject("iconList", serviceIcon);
		mv.addObject("list", ar);
		mv.setViewName("camp/list");
		return mv;
	}
	
	//detail
	@GetMapping("detail")
	public ModelAndView getCampDetail(@RequestParam HashMap<String, String> params, CampDTO campDTO, Long viewType) throws Exception{
		//requestparam 파라미터 확인용
		ModelAndView mv = new ModelAndView();
		campDTO = campService.getCampDetail(campDTO);
		logger.info("param: "+params); //sysout과 유사한 역할, 확인하고 싶은 내용을 찍어보자.
//		System.out.println("param: "+params);	
		
		mv.addObject("viewType", viewType);
		mv.addObject("dto", campDTO);
		mv.setViewName("camp/detail");
		return mv;
	}
	
	//delete
	@PostMapping("delete")
	public ModelAndView setCampDelete(@RequestParam HashMap<String, String> params, CampDTO campDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = campService.setCampDelete(campDTO, session);
		logger.info("param: "+params);
		String message = "삭제 실패";
		if(result>0) {
			message = "삭제 성공";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		return mv;
	}
	
	//add-get
	@GetMapping("add")
	public ModelAndView setCampAdd() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("camp/add");
		return mv;
	}
	
	//add-post
	@PostMapping("add")
	public ModelAndView setCampAdd(@RequestParam HashMap<String, String> params, CampDTO campDTO, MultipartFile [] files, MultipartFile thumbFile, HttpSession session, 
			String[] siteName, String[] siteSize, Long[] offWeekdaysPrice, Long[] offWeekendsPrice, Long[] peakWeekdaysPrice, Long[] peakWeekendsPrice) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//확인용 - thumbFile이 있으면 사이즈가 나올거고 없으면 0일거라 예상
		System.out.println("thumbnail size: "+thumbFile.getSize());
		
		//CampSiteDTO 저장
		List<CampSiteDTO> ar = new ArrayList<CampSiteDTO>();
		for(int i=0; i<siteName.length; i++) { //siteName의 길이값을 받아서 반복횟수결정 -> length로
			//새 옵션 반복문마다 만들어줌
			CampSiteDTO campSiteDTO = new CampSiteDTO();
			campSiteDTO.setSiteName(siteName[i]);
			campSiteDTO.setSiteSize(siteSize[i]);
			campSiteDTO.setOffWeekdaysPrice(offWeekdaysPrice[i]);
			campSiteDTO.setOffWeekendsPrice(offWeekendsPrice[i]);
			campSiteDTO.setPeakWeekdaysPrice(peakWeekdaysPrice[i]);
			campSiteDTO.setPeakWeekendsPrice(peakWeekendsPrice[i]);
			//완성된 CampSiteDTO를 CampDTO에 넣기. List이므로 여러개의 siteDTO가 들어갈 수 있음
			ar.add(campSiteDTO);
		}
		//만든 siteList CampDTO에 저장
		campDTO.setCampSiteDTOs(ar);
		
		int result = campService.setCampAdd(campDTO, files, thumbFile, session);
		logger.info("param: "+params);
		
		String message = "캠핑장 등록 실패. 관리자에게 문의하세요";
		if(result>0) {
			message = "캠핑장이 등록되었습니다";
		}
		
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}
	
	//update-get
	@GetMapping("update")
	public ModelAndView setCampUpdate(CampDTO campDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		campDTO = campService.getCampDetail(campDTO);
		//CampSiteList도 보내주기 - list라는 이름으로
		List<CampSiteDTO> ar = campService.getCampDetail(campDTO).getCampSiteDTOs();
		
		mv.addObject("dto", campDTO);
		mv.addObject("list", ar);
		mv.setViewName("camp/update");
		return mv;
	}
	
	//update-post
	@PostMapping("update")
	public ModelAndView setCampUpdate(@RequestParam HashMap<String, String> params, CampDTO campDTO, MultipartFile [] files, MultipartFile thumbFile, HttpSession session, 
			String[] siteName, String[] siteSize, Long[] offWeekdaysPrice, Long[] offWeekendsPrice, Long[] peakWeekdaysPrice, Long[] peakWeekendsPrice, Long[] fileNum, 
			Long[] areaNum) throws Exception{
		//업데이트시 적용되어야할 내용 - 1.글 내용 업데이트(CampDTO-campNum), 2.썸네일 업데이트(CampDTO-thumbnailDTO-thumbNum), 3.파일 업데이트(CampDTO-fileDTOs-fileNum), 4.사이트 업데이트(CampDTO-siteDTOs-areaNum)
		//컨트롤러에서 처리해야할 내용 - 4.사이트를 DTO로 만들어서 CampDTO에 입력해주는거 까지 해야함.
		//1, 2, 3: 해당 내용 처리 메서드 실행(서비스>DAO로 넘기기)
		//4.사이트를 DTO로 만들어서 CampDTO에 입력해주는거 까지 해야함. 서비스에서 areaNum을 통해 기존 db에 있는 siteDTO지우고 CampDTO에 있는 사이트 입력하게끔
		ModelAndView mv = new ModelAndView();
		
		//CampDTO에 CampSiteDTOs 내용 저장
		List<CampSiteDTO> ar = new ArrayList<CampSiteDTO>();
		for(int i=0; i<siteName.length; i++) {
			CampSiteDTO campSiteDTO = new CampSiteDTO();
			campSiteDTO.setSiteName(siteName[i]);
			campSiteDTO.setSiteSize(siteSize[i]);
			campSiteDTO.setOffWeekdaysPrice(offWeekdaysPrice[i]);
			campSiteDTO.setOffWeekendsPrice(offWeekendsPrice[i]);
			campSiteDTO.setPeakWeekdaysPrice(peakWeekdaysPrice[i]);
			campSiteDTO.setPeakWeekendsPrice(peakWeekendsPrice[i]);
			//완성된 CampSiteDTO를 CampDTO에 넣기. List이므로 여러개의 siteDTO가 들어갈 수 있음
			ar.add(campSiteDTO);
		}
		//만든 siteList는 CampDTO에 저장
		campDTO.setCampSiteDTOs(ar);
		
		//파일이 있는경우에 보냄
//		if(fileNum != null) {
//			System.out.println(fileNum);
//			for(Long fn : fileNum) {System.out.println(fn);}
//		}
		
		//update 실행
		//areaNum은 siteDTO 지우기 위해 필요
		int result = campService.setCampUpdate(campDTO, files, thumbFile, session, areaNum, fileNum);
		logger.info("param: "+params);
		
		String message ="수정 실패";
		if(result>0) {
			message ="수정 성공";
		}
		
		mv.addObject("result", message);
		mv.addObject("url", "./detail?campNum="+campDTO.getCampNum());
		mv.setViewName("common/result");
		
		return mv;
	}
	
	//update-ajaxFileDelete
	@PostMapping("campFileDelete")
	public ModelAndView setCampFileDelete(Long fileNum, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = campService.setCampFileDelete(fileNum, session);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
}
