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
	//@Test
	public void getCampListTest() throws Exception{
		//나중에 페이저 추가되면 페이저까지
		
		List<CampDTO> ar = campDAO.getCampList();
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
			System.out.println(campDTO.getContents());	
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
		campDTO.setContents("수도권 인근 1시간 이내, 감성 카라반, 분위기 맛집!");
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
		campDTO.setContents("날씨사유 혹은 코로나사유로 예약취소 불가합니다.");
		int result = campDAO.setCampUpdate(campDTO);
		assertEquals(1, result);
	}
	
}
