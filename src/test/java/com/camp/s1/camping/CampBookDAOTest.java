package com.camp.s1.camping;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;
import com.camp.s1.camping.book.CampBookDAO;
import com.camp.s1.camping.book.CampBookDTO;

public class CampBookDAOTest extends MyTestCase{
	
	@Autowired
	private CampBookDAO campBookDAO;
	
	//test 메서드 작성
	
	
	//getOrderNumberTest
	//@Test - 이상없음
	public void getOrderNumberTest() throws Exception{
		Long orderNum = campBookDAO.getOrderNumber();
		System.out.println(orderNum);
	}
	
	
	//setOrderNumberTest
	//@Test - 이상없음
	public void setOrderNumberTest() throws Exception{
		CampBookDTO campBookDTO = new CampBookDTO();
		//orderNum 먼저 받아오기
		Long orderNum = campBookDAO.getOrderNumber();
		//campbookDTO에 orderNum 넣고 orders 테이블에 orderNum 값 넣기
		campBookDTO.setOrderNum(orderNum);
		int result = campBookDAO.setOrderNumber(campBookDTO);
		
		assertNotEquals(0, result);
	}
	
	
	//CampBookAddTest
	//@Test - 이상없음
	public void setCampBookAddTest() throws Exception{
		CampBookDTO campBookDTO = new CampBookDTO();
		//orderNum 먼저 받아오기
		Long orderNum = campBookDAO.getOrderNumber();
		//campbookDTO에 orderNum 넣고 orders 테이블에 orderNum 값 넣기
		campBookDTO.setOrderNum(orderNum);
		int result = campBookDAO.setOrderNumber(campBookDTO);
		System.out.println(result);
		
		campBookDTO.setAreaNum(905L);
		campBookDTO.setId("user01");
		campBookDTO.setIndexCode(1L);
		//campBookDTO.setOrderNum(orderNum);
		campBookDTO.setPrice(80000L);
		campBookDTO.setStartDate("2023-04-10");
		campBookDTO.setLastDate("2023-04-11");
		campBookDTO.setAccount("112-01-6656");
		campBookDTO.setDayInfo(1L);
		
		result = campBookDAO.setCampBookAdd(campBookDTO);
		assertNotEquals(0, result);
	}
	
	
	//CampSiteDetailTest
	//@Test
	public void getCampSiteDetailTest() throws Exception{
		Long areaNum = 905L;
		CampSiteDTO campSiteDTO = campBookDAO.getCampSiteDetail(areaNum);
		
		assertNotEquals(0, campSiteDTO);
	}
	
	//getDayOfWeek
	@Test
	public void getDayOfWeekTest() throws Exception{
		//campsiteDTO에 저장하면 안된다. 저장내용이 하나밖에 없진 않을테니
		
		CampSiteDTO campSiteDTO = campBookDAO.getCampSiteDetail(943L);
		campSiteDTO.setStartDate("2023-04-10");
		campSiteDTO.setLastDate("2023-04-12");
		List<Long> dayList = campBookDAO.getDayOfWeek(campSiteDTO);
		
		Long offWeekdaysPrice = campSiteDTO.getOffWeekdaysPrice();
		Long offWeekendsPrice = campSiteDTO.getOffWeekendsPrice();
		
		Long cost = 0L;
		
		for(Long day : dayList) {
			if(day==6L || day==7L) {
				cost = cost + offWeekendsPrice;
			}else {
				cost = cost + offWeekdaysPrice;
			}
		}
		
		System.out.println(cost);
	}
	
	
}
