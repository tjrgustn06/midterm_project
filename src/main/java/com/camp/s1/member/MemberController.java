package com.camp.s1.member;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	private MemberService memberService;
	
	@PostMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(ModelAndView mv, MemberDTO memberDTO)throws Exception{
	
		boolean check = memberService.getMemberIdCheck(memberDTO);
		
		mv.addObject("result", check);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("memberAgree")
	public void setMemberAgree()throws Exception{
		
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(ModelAndView mv, MemberDTO memberDTO)throws Exception{
		
		int result = memberService.setMemberJoin(memberDTO);
		mv.setViewName("redirect:../");
	
		return mv;
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/member/memberJoin");
		return mv;
	}
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin(HttpServletRequest requset)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(MemberDTO memberDTO, HttpServletRequest request, String remember, HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(remember != null && remember.equals("remember")) {
			Cookie cookie = new Cookie("rememberId", memberDTO.getId());
			cookie.setMaxAge(60*60);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		mv.setViewName("redirect:../");
		
		return mv;
	}
	@GetMapping("memberLogout")
	public ModelAndView getMemberLogout(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		session.invalidate();
		mv.setViewName("redirect:../");
		
		return mv;
	}

	@GetMapping("memberPage")
	public ModelAndView getMemberPage(HttpSession session)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		memberDTO = memberService.getMemberPage(memberDTO);
		mv.addObject("dto", memberDTO);
		
		mv.setViewName("member/memberPage");
		return mv;
	}
	
	@GetMapping("memberUpdate")
	public ModelAndView setMemberUpdate(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberUpdate");
		
		return mv;
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(HttpSession session, MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMemberDTO.getId());
		
		int result = memberService.setMemberUpdate(memberDTO);
		mv.setViewName("redirect:./memberPage");
		
		return mv;
	}
	
	@GetMapping("memberDelete")
	public ModelAndView setMemberDelete(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberDelete(memberDTO);
		
		mv.setViewName("redirect:../");
		return mv;
	}
	
	
	
	
	
	
}