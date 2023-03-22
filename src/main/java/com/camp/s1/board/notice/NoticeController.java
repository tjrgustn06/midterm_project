package com.camp.s1.board.notice;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.camp.s1.board.BoardFileDTO;
import com.camp.s1.util.Pager;

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
	public ModelAndView getBoardList(Pager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("list", noticeService.getBoardList(pager));
		mv.addObject("pager", pager);
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
	public ModelAndView setBoardAdd(NoticeDTO noticeDTO, MultipartFile [] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		
		
		
		int result = noticeService.setBoardAdd(noticeDTO, files, session);
		
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
	public ModelAndView getBoardDetail(NoticeDTO noticeDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		
		mv.setViewName("/board/detail");
		mv.addObject("dto", noticeService.getBoardDetail(noticeDTO));
		
		//조회수 로직
		
		Cookie oldCookie = null;
		Cookie [] cookies = request.getCookies();
		
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("boardView")) {
					oldCookie = cookie;
				}
			}
		}
		
		if(oldCookie != null) {
			if(!oldCookie.getValue().contains("[" + noticeDTO.getNum() + "]")) {
				oldCookie.setValue("[" + noticeDTO.getNum() + "]");
				oldCookie.setMaxAge(60*60*24);
				oldCookie.setPath("/");
				noticeService.setBoardHitCount(noticeDTO);
				response.addCookie(oldCookie);
			}
		}
		else {
			Cookie newCookie = new Cookie("boardView", "[" + noticeDTO.getNum() + "]");
			newCookie.setMaxAge(60*60*24);
			newCookie.setPath("/");
			noticeService.setBoardHitCount(noticeDTO);
			response.addCookie(newCookie);
		}
		
		
		
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(NoticeDTO noticeDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", noticeService.setBoardDelete(noticeDTO, session));
		
		
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
	public ModelAndView setBoardUpdate(NoticeDTO noticeDTO, MultipartFile [] files, HttpSession session, Long [] fileNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = noticeService.setBoardUpdate(noticeDTO, files, session);
			
		String msg = "수정 실패";
		if(result > 0) {
			msg = "수정이 완료되었습니다!";
		}
		
		
		
		mv.setViewName("common/result");
		mv.addObject("result", msg);
		mv.addObject("url", "./detail?num="+noticeDTO.getNum());
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView getFileDown(BoardFileDTO boardFileDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("boardFile", noticeService.getBoardFileDetail(boardFileDTO));
		mv.setViewName("fileDownView");
		
		
		return mv;
	}
	
	@PostMapping("boardFileDelete")
	public ModelAndView setBoardFileDelete(Long fileNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", noticeService.setBoardFileDelete(fileNum));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
}
