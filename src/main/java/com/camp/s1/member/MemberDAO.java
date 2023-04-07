package com.camp.s1.member;



import java.util.HashMap;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
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
	
	//Login
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
	
	public int setEachAddressDelete(AddressDTO addressDTO)throws Exception{
		
		return sqlSession.delete(NAMESPACE+"setEachAddressDelete", addressDTO);
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
	
		//pw변경
		public int setMemberPwChange(MemberDTO memberDTO)throws Exception{
			
			return sqlSession.update(NAMESPACE+"setMemberPwChange", memberDTO);
		}
	
		//카카오 로그인
		public void kakaoLogin(HashMap<String, Object> userInfo) {
			
			sqlSession.insert(NAMESPACE+"kakaoLogin", userInfo);
		}
		
		//카카오 확인
		public KakaoDTO findKakao(HashMap<String, Object> userInfo) {
			System.out.println("RN:"+userInfo.get("nickname"));
			System.out.println("RE:"+userInfo.get("email"));
			return sqlSession.selectOne(NAMESPACE+"findKakao", userInfo);
		}
		
}
