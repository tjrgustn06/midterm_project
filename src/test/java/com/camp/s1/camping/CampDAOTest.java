package com.camp.s1.camping;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;

public class CampDAOTest extends MyTestCase{
	
	@Autowired
	private CampDAO campDAO;
	
	//list
	@Test
	public void getCampListTest() throws Exception{
		//나중에 페이저 추가되면 페이저까지
		
		List<CampDTO> ar = campDAO.getCampList();
		System.out.println(ar.size());
		assertNotEquals(0, ar.size());
	}
}
