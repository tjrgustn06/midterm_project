package com.camp.s1.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.camp.s1.member.MemberDAO.";
	
	
	public MemberDTO getMemberLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberLogin", memberDTO);
	}
	
	public int setMemberJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberJoin", memberDTO);
	}
	
	public int setMemberUpdate(MemberDTO memberDTO)throws Exception {
		return sqlSession.update(NAMESPACE+"setMemberUpdate", memberDTO);
	}

	public int setMemberRoleAdd(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setMemberRoleAdd", memberDTO);
	}
	
	public int setMemberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMemberDelete", memberDTO);
	}
	
}
