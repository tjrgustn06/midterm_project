package com.camp.s1.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	//IDCheck
	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
		
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		
		boolean check = true;
		
		if(memberDTO != null) {
			check = false;
		}
		return check;
	}
	
	//Join
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberJoin(memberDTO);
		
		for(AddressDTO addressDTO:memberDTO.getAddressDTOs()) {
			addressDTO.setId(memberDTO.getId());
			result = memberDAO.setAddressJoin(addressDTO);
		}
		
		return result;
	}
	
	//Login
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{

		MemberDTO result = memberDAO.getMemberLogin(memberDTO);
		
		if(result != null && memberDTO.getPw().equals(result.getPw())) {
			
			memberDTO.setPw(null);
			memberDTO.setRoleName(result.getRoleName());
			return memberDTO;
			
		}else {
			
			return null;
		}	
	}
	
	//MemberPage
	public MemberDTO getMemberPage(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.getMemberLogin(memberDTO);
	}
	
	//Update
	public int setMemberUpdate(AddressDTO addressDTO, MemberDTO memberDTO)throws Exception {
		
		int result = memberDAO.setMemberUpdate(memberDTO);
			
		addressDTO.setId(memberDTO.getId());
		
		result = memberDAO.setAddressUpdate(addressDTO);

		return result;
	}
	
	//Delete
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		
		int result = memberDAO.setMemberDelete(memberDTO);
		
		return result;
	}
	
	//ID찾기
		public MemberDTO findId(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			PrintWriter out = response.getWriter();
			
			MemberDTO id = memberDAO.findId(memberDTO);
			
			if(id == null) {
				out.println("<script>");
				out.println("alert('가입된 아이디가 없습니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				return id;
			}
		}
		
		//pw 찾기
		public MemberDTO findPw(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
			
			PrintWriter out = response.getWriter();
			
			if(memberDTO.getId() == null) {
				 out.println("아이디가 없습니다");
				 out.close();
			}else if(!memberDTO.getEmail().equals(memberDAO.getMemberLogin(memberDTO))){
				 out.println("잘못된 이메일 입니다");
				 out.close();
			}else {
				String pw ="";
				for(int i=0; i<6; i++) {
					pw += (char) ((Math.random() * 26) + 97);		
				}
				memberDTO.setPw(pw);
				//비밀번호 변경
				memberDAO.setMemberPwChange(memberDTO);
				//sendMail(memberDTO, "findPw");
				 out.println("이메일로 임시 비밀번호를 발송하였습니다");
				 out.close();
			}
			return memberDTO;
			
		}
		
			//비밀 번호 변경
		public int setMemberPwChange(MemberDTO memberDTO, String oldPw, HttpServletResponse response)throws Exception{
			PrintWriter out = response.getWriter();
			
			if(oldPw.equals(memberDTO.getPw())){
				
			return memberDAO.setMemberPwChange(memberDTO);
			
			}else {	
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return 0;
			}
			
			
		}

	
}
