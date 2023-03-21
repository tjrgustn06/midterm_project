package com.camp.s1.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.camp.s1.member.MemberDAO.";
	
	public int getAddressJoin(AddressDTO addressDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"getAddressJoin", addressDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception{
		
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}
	
}
