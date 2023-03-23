package com.camp.s1.member;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(ModelAndView mv, MemberDTO memberDTO)throws Exception{
		
		
		boolean check = memberService.getMemberIdCheck(memberDTO);
		System.out.println(check);
		mv.addObject("result", check);
		mv.setViewName("common/ajaxResult");
		return mv;
		
	}
	
	@RequestMapping(value = "memberAgree", method = RequestMethod.GET)
	public void setMemberAgree() throws Exception{
		
	}
	
	@GetMapping("memberJoin")
	public ModelAndView setMemberJoin()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberJoin");
		return mv;
	}
	
	@PostMapping("memberJoin")
	public ModelAndView setMemberJoin(ModelAndView mv, MemberDTO memberDTO, String [] id)throws Exception{
		ArrayList<AddressDTO> addressDTOs = new ArrayList<AddressDTO>();
		
		memberDTO.setAddressDTOs(addressDTOs);
		int result = memberService.setMemberJoin(memberDTO);
		String msg ="가입 실패";
		
		if(result>0){
			msg="가입 성공";
		}
		
		System.out.println("MSG + " + msg);
		mv.setViewName("redirect:./memberLogin");
		return mv;
	}
	
	@GetMapping("memberLogin")
	public ModelAndView getMemberLogin(HttpServletRequest request)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/memberLogin");		
		
		return mv;
	}
	
	@PostMapping("memberLogin")
	public ModelAndView getMemberLogin(HttpSession session, MemberDTO memberDTO, HttpServletRequest request, 
			String remember, HttpServletResponse response)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		if(remember!=null && remember.equals("remember")) {
			Cookie cookie = new Cookie("rememberId", memberDTO.getId());
			cookie.setMaxAge(-1);//초단위
			response.addCookie(cookie);	
		}else {
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		memberDTO = memberService.getMemberLogin(memberDTO);
		if(memberDTO != null) {
				session = request.getSession();
			session.setAttribute("member", memberDTO);
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
		memberDTO = memberService.getMemberPage(memberDTO);
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberUpdate");
		return mv;		
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(AddressDTO addressDTO, HttpSession session, MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setMemberUpdate(addressDTO, memberDTO);
		
		System.out.println(memberDTO.getId());
		MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMemberDTO.getId());
		
		
		String msg="수정 실패";
		
		if(result>0) {
			msg="수정이 완료되었습니다";
		}
	
		mv.setViewName("redirect:./memberPage");
		
		return mv;
	}
	
	//Delete
	@PostMapping("memberDelete")
	public ModelAndView setMemberDelete(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result",memberService.setMemberDelete(memberDTO));
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
}
