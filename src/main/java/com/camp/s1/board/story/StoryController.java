package com.camp.s1.board.story;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.util.Pager;


@Controller
@RequestMapping("/story/*")
public class StoryController {

	@Autowired
	private StoryService storyService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "story";
	}
	
	@GetMapping("list")
	public ModelAndView getListPage(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("/story/list");
		mv.addObject("list", storyService.getBoardList(pager));
		
		
		return mv;
		
	}
	
	@GetMapping("listPage")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("common/storyList");
		mv.addObject("list", storyService.getBoardList(pager));
		
		
		
		return mv;
		
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/story/add");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(StoryDTO storyDTO, MultipartFile [] files, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = storyService.setBoardAdd(storyDTO, files, session);
		
		String msg = "등록 실패";
		
		if(result > 0) {
			msg = "글이 등록되었습니다";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", msg);
		mv.addObject("url", "./list");
		
	
					
		return mv;
		
	}
	
	
}
