package com.camp.s1.board.notice;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.board.BoardDTO;

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
		
		
		mv.setViewName("board/add");
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		
		int result = noticeService.setBoardAdd(noticeDTO, null, null);
		
		String msg = "등록 실패";
		
		if(result > 0) {
			msg =  "등록 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("url", "./list");
				
				
		mv.setViewName("common/result");
		return mv;
		
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/board/detail");
		mv.addObject("dto", noticeService.getBoardDetail(noticeDTO));
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", noticeService.setBoardDelete(noticeDTO, null));
		
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(NoticeDTO noticeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/update");
		mv.addObject("dto", noticeService.getBoardDetail(noticeDTO));
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(NoticeDTO noticeDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/update");
		mv.addObject("dto", noticeService.getBoardDetail(noticeDTO));
		return mv;
	}
	
	
}
