package com.camp.s1.member;

import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		memberDTO = memberService.getMemberLogin(memberDTO);
		
		System.out.println("3333333333");
		if(memberDTO !=null) {
		HttpSession session = request.getSession();
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
		
		mv.addObject("dto", memberDTO);
		mv.setViewName("member/memberUpdate");
		
		return mv;
	}
	
	@PostMapping("memberUpdate")
	public ModelAndView setMemberUpdate(HttpSession session, MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMemberDTO.getId());
		
		int result = memberService.setMemberUpdate(memberDTO, null);
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
		
	//ID 확인 폼
	@RequestMapping(value = "findIdForm")
	public String setMemberFindId()throws Exception{
		return "/member/findIdForm";
	}
	
	//Id 찾기
	@PostMapping("findId")
	public String findId(HttpServletResponse response, String email, Model md)throws Exception{
		
		md.addAttribute("id", memberService.findId(response, email));
		
		return "/member/findId";
	}
	
	//pw 찾기 폼
	@RequestMapping(value = "findPwForm")
	public String findPwForm()throws Exception{
		return "/member/findPwForm";
	}
	//Pw찾기
	@PostMapping("findPw")
	public void findPw(@ModelAttribute MemberDTO memberDTO, HttpServletResponse response)throws Exception{
		memberService.findPw(response, memberDTO);
	}
	
	//Pw변경
	@PostMapping("memberPwUpdate")
	public String setmemberPwUpdate(MemberDTO memberDTO, String oldPw, HttpSession session,
			HttpServletResponse response, RedirectAttributes attr)throws Exception{
		
		session.setAttribute("member", memberService.setMemberPwUpdate(memberDTO, oldPw, response));
		
		attr.addFlashAttribute("msg", "비밀번호 수정 완료");
		
		return "redirect:/member/memberPage";
		
	}
	
	
	
}