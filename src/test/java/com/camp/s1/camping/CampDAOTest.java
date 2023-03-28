package com.camp.s1.camping;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;
import com.camp.s1.util.Pager;

public class CampDAOTest extends MyTestCase{
	
	@Autowired
	private CampDAO campDAO;
	
	//list
	//@Test
	public void getCampListTest() throws Exception{
		//나중에 페이저 추가되면 페이저까지
		Pager pager = new Pager();
		pager.setNum(3L);
		
		pager.setKind("name");
		pager.setSearch("i");
		pager.makeRow();
		
		List<CampDTO> ar = campDAO.getCampList(pager);
		assertNotEquals(0, ar.size());
	}
	
	//@Test
	public void getCampDetailTest() throws Exception{
		CampDTO campDTO = new CampDTO();
		campDTO.setCampNum(3L);
		campDTO = campDAO.getCampDetail(campDTO);
		if(campDTO != null) {
			System.out.println(campDTO.getCampNum());
			System.out.println(campDTO.getName());
			System.out.println(campDTO.getPhone());
			System.out.println(campDTO.getAddress());
		}else if(campDTO == null) {
			System.out.println("camp 정보를 불러올 수 없음");
		}
		assertNull(campDTO);
	}
	
	//@Test
	public void setCampAddTest() throws Exception{
		CampDTO campDTO = new CampDTO();
		campDTO.setName("범바위캠핑정원");
		campDTO.setPhone("010-2289-1111");
		campDTO.setAddress("경기 김포시 대곶면 종생로 154");
		int result = campDAO.setCampAdd(campDTO);
		assertNotEquals(0, result);
	}
	
	//@Test
	public void setCampDeleteTest() throws Exception{
		CampDTO campDTO = new CampDTO();
		campDTO.setCampNum(29L);
		int result = campDAO.setCampDelete(campDTO);
		assertNotEquals(1, result);
	}
	
	//@Test
	public void setCampUpdateTest() throws Exception{
		CampDTO campDTO = new CampDTO();
		campDTO.setCampNum(2L);
		campDTO.setName("글램비캠핑장");
		campDTO.setPhone("010-5904-1111");
		campDTO.setAddress("경기 화성시 서신면 해안길64");
		int result = campDAO.setCampUpdate(campDTO);
		assertEquals(1, result);
	}
	
	//옵션까지 불러오는 테스트 가능한가? 55번 기준
	//@Test
//	public void getCampSiteListTest() throws Exception{
//		CampDTO campDTO = new CampDTO();
//		campDTO.setCampNum(55L);
//		List<CampSiteDTO> ar = campDAO.getCampSiteList(campDTO);
//		if(ar.size()!=0) {
//			for(CampSiteDTO campSiteDTO : ar) {
//				System.out.println(campSiteDTO.getSiteName());
//				System.out.println(campSiteDTO.getPrice());
//			}
//			assertNotEquals(0, ar.size());
//		}
//	}
	
	//@Test
	public void setCampSiteAddTest() throws Exception{
		CampSiteDTO campSiteDTO = new CampSiteDTO();
		//campSiteDTO.setAreaNum(99L); SEQ
		campSiteDTO.setCampNum(582L);
		campSiteDTO.setSiteName("일반A2");
		campSiteDTO.setSiteSize("9*11");
		campSiteDTO.setOffWeekdaysPrice(50000L);
		campSiteDTO.setOffWeekendsPrice(70000L);
		campSiteDTO.setPeakWeekdaysPrice(80000L);
		campSiteDTO.setPeakWeekendsPrice(100000L);
		
		int result = campDAO.setCampSiteAdd(campSiteDTO);
		assertNotEquals(0, result);
	}
	
}
