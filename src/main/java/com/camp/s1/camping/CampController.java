package com.camp.s1.camping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public ModelAndView setCampDelete(CampDTO campDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = campService.setCampDelete(campDTO);
		String message = "삭제 실패";
		if(result>0) {
			message = "삭제 성공";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", message);
		mv.addObject("url", "./list");
		return mv;
	}
	
	//add
	@GetMapping("add")
	public ModelAndView setCampAdd(CampDTO campDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	
}
