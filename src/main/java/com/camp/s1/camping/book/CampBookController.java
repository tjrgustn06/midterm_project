package com.camp.s1.camping.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/camp/book/*")
public class CampBookController {

	@Autowired
	private CampBookService campBookService;
	
	
	//필요한 메서드 작성
	
	//예약페이지로 넘어오기
	@GetMapping("site")
	public ModelAndView getCampBookSite(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("camp/book/book");
		return mv;
	}
	
}
