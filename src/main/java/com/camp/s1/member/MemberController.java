package com.camp.s1.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camp.s1.util.Pager;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;





@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@PostMapping("memberIdCheck")
	public ModelAndView getMemberIdCheck(ModelAndView mv, MemberDTO memberDTO)throws Exception{
		
		
		boolean check = memberService.getMemberIdCheck(memberDTO);

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
	public ModelAndView setMemberJoin(AddressDTO addressDTO,ModelAndView mv, MemberDTO memberDTO, String [] id)throws Exception{
		System.out.println(addressDTO.getAddress());
		ArrayList<AddressDTO> addressDTOs = new ArrayList<AddressDTO>();
		addressDTOs.add(addressDTO);
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
	public ModelAndView setMemberUpdate(MemberDTO memberDTO, AddressDTO addressDTO, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(sessionMemberDTO.getId());
		addressDTO.setId(sessionMemberDTO.getId());
		int result = memberService.setMemberUpdate(memberDTO, addressDTO);
		
		String msg="수정 실패";
		
		if(result>0) {
			msg="수정이 완료되었습니다";
		}
		
		
		mv.addObject("result", msg);
		mv.setViewName("common/result");
		
		return mv;
	}
		
	@PostMapping("roleNameUpdate")
	public ModelAndView setRoleNameUpdate(MemberDTO memberDTO)throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setRoleNameUpdate(memberDTO);
		
		String msg="수정 실패";
		
		if(result>0) {
			msg="수정이 완료되었습니다";
		}
		
		
		mv.addObject("result", msg);
		mv.setViewName("common/result");
		
		return mv;
	}
	
	@PostMapping("addressDelete")
	public ModelAndView setEachAddressDelete(AddressDTO addressDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = memberService.setEachAddressDelete(addressDTO);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//Delete
	@PostMapping("memberDelete")
	public ModelAndView setMemberDelete(MemberDTO memberDTO)throws Exception{
		ModelAndView mv = new ModelAndView();
				
		mv.addObject("result", memberService.setMemberDelete(memberDTO));
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//ID 확인 폼
		@GetMapping("findIdForm")
		public ModelAndView setMemberFindId()throws Exception{
			ModelAndView mv = new ModelAndView();
			
			mv.setViewName("/member/findIdForm");
			return mv;
		}
		
		//Id 찾기
		@PostMapping("findId")
		public ModelAndView findId(HttpServletResponse response, MemberDTO memberDTO, ModelAndView mv)throws Exception{
			
			memberDTO = memberService.findId(response, memberDTO);
			
			mv.addObject("id", memberDTO.getId());
			mv.setViewName("/member/findId");
			return mv;
		}
		

		//pw 찾기 
		@GetMapping("findPw")
		public ModelAndView findPw()throws Exception{
			ModelAndView mv = new ModelAndView();
			
			return mv;
		}
		
		//Pw찾기
		@PostMapping("findPw")
		public ModelAndView findPw(MemberDTO memberDTO, HttpServletResponse response)throws Exception{
			ModelAndView mv = new ModelAndView();
			
			memberService.findPw(response, memberDTO);
			
			return mv;
		}
		
		@GetMapping("memberPwChange")
		public ModelAndView setMemberPwChange(HttpSession session)throws Exception {
			ModelAndView mv = new ModelAndView();
			
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			memberDTO = memberService.getMemberPage(memberDTO);
			
			mv.addObject("dto", memberDTO);
			mv.setViewName("member/memberPwChange");
			return mv;
		}
		
		//Pw변경
		@PostMapping("memberPwChange")
		public ModelAndView setMemberPwChange(MemberDTO memberDTO, String oldPw, HttpSession session,
			HttpServletResponse response)throws Exception{
			
			ModelAndView mv = new ModelAndView();
			
			int result = memberService.setMemberPwChange(memberDTO, oldPw, response);
			
			MemberDTO sessionMemberDTO = (MemberDTO)session.getAttribute("member");
			memberDTO.setPw(sessionMemberDTO.getPw());
			
			String msg = "비밀변호 변경 실패";
			
			if(result>0) {
				msg="비밀번호 변경 성공";
			}
			
			mv.setViewName("member/memberPage");
			return mv;
			
		}
		
		//카카오 로그인 토큰 받기
		@GetMapping("kakaoLogin")
	    public String kakaoLogin(@RequestParam(value = "code", required = false) String code, HttpSession session) throws Exception {
			
	    	String access_Token = memberService.getAccessToken(code);
	    	KakaoDTO userInfo = memberService.getUserInfo(access_Token);

	    	MemberDTO memberDTO = new MemberDTO();
	    	memberDTO.setId(userInfo.getKakaoEmail());
	    	memberDTO.setName(userInfo.getKakaoName());

	    	session.setAttribute("member", memberDTO);

	    	return "home";
	    }
		
		//회원 List 출력
		@GetMapping("memberList")
		public ModelAndView getMemberList(Pager pager) throws Exception {
			ModelAndView mv = new ModelAndView();
			pager.setPerPage(20L);
			List<MemberDTO> ar = memberService.getMemberList(pager);
			mv.addObject("list", ar);
			mv.addObject("pager", pager);
			mv.setViewName("member/memberList");
			return mv;
		}


}