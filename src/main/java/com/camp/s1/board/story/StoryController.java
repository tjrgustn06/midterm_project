package com.camp.s1.board.story;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;


@Controller
@RequestMapping("/story/*")
public class StoryController {

	@Autowired
	private StoryService storyService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("/story/list");
		mv.addObject("list", storyService.getBoardList(pager));
		
		
		
		return mv;
		
	}
	
	
}
