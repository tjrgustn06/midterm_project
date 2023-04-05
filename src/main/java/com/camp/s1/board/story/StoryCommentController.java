package com.camp.s1.board.story;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/storyComment/*")
public class StoryCommentController {
	
	@Autowired
	private StoryCommentService storyCommentService;
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/commentList");
		mv.addObject("commentList", storyCommentService.getBoardList(pager));
		
		
		
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView setBoardadd(StoryCommentDTO storyCommentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", storyCommentService.setBoardAdd(storyCommentDTO));
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(StoryCommentDTO storyCommentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", storyCommentService.setBoardUpdate(storyCommentDTO));
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(StoryCommentDTO storyCommentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", storyCommentService.setBoardDelete(storyCommentDTO));
		
		return mv;
	}
	
	@PostMapping("subCommentAdd")
	public ModelAndView setSubCommentAdd(StoryCommentDTO storyCommentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", storyCommentService.setSubCommentAdd(storyCommentDTO));
		
		return mv;
	}
	
}
