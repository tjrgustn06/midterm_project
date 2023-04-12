package com.camp.s1.board.qna;

import java.util.Iterator;

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
@RequestMapping("/qna/*")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "qna";
	}
	
	
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/board/list");
		
		mv.addObject("list", qnaService.getBoardList(pager));
		
		
		return mv;
		
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(QnaDTO qnaDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/board/detail");
		mv.addObject("dto", qnaService.getBoardDetail(qnaDTO));
		
		
		//조회수 로직
		Cookie oldCookie = null;
		Cookie [] cookies = request.getCookies();
		
		//request 객체에서 쿠키 꺼냄
		//쿠키가 null이 아니고 boardView란 이름의 쿠키가 존재할 때
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals("boardView")) {
					oldCookie = cookie;
				}
			}
		}
		
		//쿠키가 존재할 때
		//쿠키의 값 중에 글번호를 포함하고 있지 않을 때
		if(oldCookie != null) {
			if(!oldCookie.getValue().contains("["+qnaDTO.getNum()+"]")) {
				oldCookie.setValue("[" + qnaDTO.getNum() + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60*60*24);
				qnaService.setBoardHitCount(qnaDTO);
				response.addCookie(oldCookie);
			}
		}
		
		//쿠키가 존재하지 않을 때
		//boardView란 이름의 쿠키 새로 생성
		//값은 [글번호]
		else {
			Cookie newCookie = new Cookie("boardView", "[" + qnaDTO.getNum() + "]");
			newCookie.setMaxAge(60*60*24);
			newCookie.setPath("/");
			qnaService.setBoardHitCount(qnaDTO);
			response.addCookie(newCookie);
			
			
		}
		
		return mv;
	}
	
	@GetMapping("fileDown")
	public ModelAndView getFileDown(BoardFileDTO boardFileDTO) throws Exception {
		ModelAndView mv = new  ModelAndView();
		
		mv.addObject("boardFile", qnaService.getBoardFileDetail(boardFileDTO));
		mv.setViewName("fileDownView");
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/board/add");
		
		return mv;
		
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(QnaDTO qnaDTO, MultipartFile [] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setBoardAdd(qnaDTO, files, session);
		
		String msg = "등록 실패";
		if(result > 0) {
			msg = "글이 등록되었습니다";
		}
		
		
		
		mv.setViewName("common/result");
		mv.addObject("result", msg);
		mv.addObject("url", "./list");
		
		return mv;
		
	}
	
	@PostMapping("delete")
	public ModelAndView setBoardDelete(QnaDTO qnaDTO, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		int result = qnaService.setBoardDelete(qnaDTO, session);
		
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@GetMapping("update")
	public ModelAndView setBoardUpdate(QnaDTO qnaDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/board/update");
		mv.addObject("dto", qnaService.getBoardDetail(qnaDTO));
		return mv;
		
	}
	
	@PostMapping("update")
	public ModelAndView setBoardUpdate(QnaDTO qnaDTO, MultipartFile [] files, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setBoardUpdate(qnaDTO, files, session);
		
		String msg = "수정 실패";
		if(result > 0) {
			msg = "글이 수정되었습니다";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", msg);
		mv.addObject("url", "./detail?num="+qnaDTO.getNum());
		
		return mv;
		
	}
	
	@PostMapping("boardFileDelete")
	public ModelAndView setBoardFileDelete(Long fileNum, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = qnaService.setBoardFileDelete(fileNum, session);
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", result);
		
		
		return mv;
	}
	
	
	
}


