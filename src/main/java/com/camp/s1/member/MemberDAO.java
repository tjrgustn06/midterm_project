package com.camp.s1.member;



import java.util.HashMap;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.camp.s1.member.MemberDAO.";
	
	// Join
	public int setAddressJoin(AddressDTO addressDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddressJoin", addressDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	//Update
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
	public int setAddressUpdate(AddressDTO addressDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"setAddressUpdate", addressDTO);
	}
	
	//Delete
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}
	
	public int setAddressDelete(AddressDTO addressDTO)throws Exception{
		
		return sqlSession.delete(NAMESPACE+"setAddressDelete", addressDTO);
	}
	
	//ID찾기
	public MemberDTO findId(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findId", memberDTO);
	}
	
	//Email 발송
	
	public void sendMail(MemberDTO memberDTO, String div) throws Exception {
		// Mail Server 설정
		System.out.println("check");
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "tjrgustn06@naver.com"; // 아이디
		String hostSMTPpwd = ""; //비밀번호

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "tjrgustn06@naver.com"; //보내는사람 아이디
		String fromName = "Spring Homepage";
		String subject = ""; //제목
		String msg = ""; //내용(본문)
		
		if(div.equals("findPw")) {
			subject = "Spring Homepage 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberDTO.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberDTO.getPw() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
				String mail = memberDTO.getEmail();
				try {
					System.out.println("check");
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(465);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
			}

		//pw변경
		public int setMemberPwChange(MemberDTO memberDTO)throws Exception{
			
			return sqlSession.update(NAMESPACE+"setMemberPwChange", memberDTO);
		}
	
		//카카오 로그인
		public void KakaoLogin(HashMap<String, Object> userInfo) {
				sqlSession.insert(NAMESPACE+"KakaoLogin", userInfo);
		}

		public KakaoDTO findKakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return sqlSession.selectOne(NAMESPACE+"findKakao", userInfo);
		}
}
