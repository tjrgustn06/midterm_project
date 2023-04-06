package com.camp.s1.camping;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;
import com.camp.s1.camping.book.CampBookDAO;
import com.camp.s1.camping.book.CampBookDTO;

public class CampBookDAOTest extends MyTestCase{
	
	@Autowired
	private CampBookDAO campBookDAO;
	
	//test 메서드 작성
	
	
	//getOrderNumTest
	@Test
	public void getOrderNumTest() throws Exception{
		Long orderNum = campBookDAO.getOrderNum();
		assertEquals(0);
	}
	
	//CampBookAddTest
	@Test
	public void setCampBookAddTest() throws Exception{
		CampBookDTO campBookDTO = new CampBookDTO();
		Long orderNum = campBookDAO.getOrderNum();
				
		campBookDTO.setAreaNum(904L);
		campBookDTO.setId("user01");
		campBookDTO.setIndexCode(1L);
		campBookDTO.setOrderNum(orderNum);
		campBookDTO.setPrice(80000L);
		campBookDTO.setStartDate("2023-04-10");
		campBookDTO.setLastDate("2023-04-11");
		campBookDTO.setAccount("112-01-665241-03");
		campBookDTO.setDayInfo(1L);
		
		int result = campBookDAO.setCampBookAdd(campBookDTO);
		assertNotEquals(0, result);
	}
}
