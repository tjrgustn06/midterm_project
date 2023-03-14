package com.camp.s1.member;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAOTest {

	
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void setMemberLoginTest()throws Exception{
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setRoleName("ADMIN");
		memberDTO = memberDAO.getMemberLogin(memberDTO);
		assertNotNull(memberDTO);
	}
}
