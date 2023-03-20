package com.camp.s1.member;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.util.FileManager;



@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private FileManager fileManager;
	
	public boolean getMemberIdCheck(MemberDTO memberDTO)throws Exception{
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		
		boolean check =  true;
		if(memberDTO !=null) {
			check = false;
		}
		return check;
	}
	
	public int setMemberJoin(MemberDTO memberDTO)throws Exception {
		
		int result = memberDAO.setMemberJoin(memberDTO);
		
		return result;
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{
		
		
		
		MemberDTO result = memberDAO.getMemberLogin(memberDTO);
		
		if(result != null && memberDTO.getPw().equals(result.getPw())) {
			
			memberDTO.setPw(null);
			return memberDTO;
			
		}else {
			return null;
		}
			
	
	}
	
	public MemberDTO getMemberPage(MemberDTO memberDTO)throws Exception{
	
		return memberDAO.getMemberLogin(memberDTO);
	}

	public int setMemberUpdate(MemberDTO memberDTO, MultipartFile pic)throws Exception{
		
		int result = memberDAO.setMemberUpdate(memberDTO);
		
		if(!pic.isEmpty()) {
			String realPath = servletContext.getRealPath("resources/upload/member");
			
			String fileName = fileManager.fileSave(pic, realPath);
			
			//2. DB에 저장
			MemberImgDTO memberImgDTO = new MemberImgDTO();
			
			memberImgDTO.setFileName(fileName);
			memberImgDTO.setOriName(pic.getOriginalFilename());
			memberImgDTO.setId(memberDTO.getId());
			result = memberDAO.setMemberUpdateImg(memberImgDTO);
		}
		return result;
	}
	
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemberDelete(memberDTO);
	}

	//ID찾기
	public String findId(HttpServletResponse response, String email)throws Exception{
		
		PrintWriter out = response.getWriter();
		
		String id = memberDAO.findId(email);
		
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
	public void findPw(HttpServletResponse response, MemberDTO memberDTO)throws Exception{
		
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
			memberDAO.setMemberPwUpdate(memberDTO);
			//sendMail(memberDTO, "findPw");
			 out.println("이메일로 임시 비밀번호를 발송하였습니다");
			 out.close();
		}
		
	}
	
		//비밀 번호 변경
	public int setMemberPwUpdate(MemberDTO memberDTO, String oldPw, HttpServletResponse response)throws Exception{
		PrintWriter out = response.getWriter();
		
		if(oldPw.equals(memberDTO.getPw())){
			
		return memberDAO.setMemberPwUpdate(memberDTO);
		
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
