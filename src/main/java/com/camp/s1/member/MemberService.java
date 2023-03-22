package com.camp.s1.member;

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
			result = memberDAO.getAddressJoin(addressDTO);
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
	

	
}
