package com.camp.s1.board.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/notice/*")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "notice";
	}
	
	@GetMapping("list")
	public ModelAndView getBoardList() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", noticeService.getBoardList());
		mv.setViewName("/board/list");
		
		return mv;
	
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("/board/add");
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("Writer : " + noticeDTO.getWriter());
		System.out.println("Writer : " + noticeDTO.getTitle());
		System.out.println("Writer : " + noticeDTO.getContents());
		
		
		int result = noticeService.setBoardAdd(noticeDTO, null, null);
				
		
		
		mv.setViewName("/board/add");
		return mv;
		
	}
}
