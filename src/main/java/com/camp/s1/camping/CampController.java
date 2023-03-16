package com.camp.s1.camping;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/camp/*")
public class CampController {

	@Autowired
	private CampService campService;
	
	//만약에 product랑 jsp 같이 쓸거면 필요한데 안그럴거같음
//	@ModelAttribute("boardName")
//	public String getBoardName() {
//		return "BankBookComment";
//	}
	
	//list
	@GetMapping("list")
	public ModelAndView getCampList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CampDTO> ar = campService.getCampList(pager);

		mv.addObject("list", ar);
		mv.setViewName("camp/list");
		return mv;
	}
	
	//detail
	@GetMapping("detail")
	public ModelAndView getCampDetail(CampDTO campDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		campDTO = campService.getCampDetail(campDTO);
		
		mv.addObject("dto", campDTO);
		mv.setViewName("camp/detail");
		return mv;
	}
	
	//delete
	@PostMapping("delete")
	public ModelAndView setCampDelete(CampDTO campDTO, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = campService.setCampDelete(campDTO, session);
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
	public ModelAndView setCampAdd(CampDTO campDTO, MultipartFile [] files, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = campService.setCampAdd(campDTO, files, session);
		String message = "캠프장 등록 실패<br>관리자에게 문의하세요";
		if(result>0) {
			message = "캠프장이 등록되었습니다";
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
		
		mv.addObject("dto", campDTO);
		mv.setViewName("camp/update");
		return mv;
	}
	
	//update-post
	@PostMapping("update")
	public ModelAndView setCampUpdate(CampDTO campDTO, MultipartFile[] files, HttpSession session, Long[] fileNum) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		System.out.println(fileNum);
		for(Long fn : fileNum) {System.out.println(fn);}
		
		
		return mv;
		
		
	}
}
