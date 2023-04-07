package com.camp.s1.member;



import java.util.HashMap;
import java.util.List;

import javax.swing.event.ListSelectionListener;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.util.Pager;

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
	
	//Logion
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
		
		//memberList(관리자용)
		public List<MemberDTO> getMemberList(Pager pager) throws Exception {
			return sqlSession.selectList(NAMESPACE+"getMemberList", pager);
		}
		
		//총 회원 출력
		public Long getTotalCount(Pager pager) throws Exception {
			return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
		}
		
}
