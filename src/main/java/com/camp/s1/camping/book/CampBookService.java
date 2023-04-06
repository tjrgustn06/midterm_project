package com.camp.s1.camping.book;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;

@Service
public class CampBookService {

	@Autowired
	private CampBookDAO campBookDAO;
	
	
	//필요한 메서드 작성
	//campSite 가져오기
	public List<CampSiteDTO> getCampSiteList(CampDTO campDTO) throws Exception{
		List<CampSiteDTO> ar = campBookDAO.getCampSiteList(campDTO);
		return ar;
	}
	
	//예약 추가
	public int setCampBookAdd(CampBookDTO campBookDTO) throws Exception{
		//필수 입력값: num / areanum, id, indexcode, ordernum / 나머지컬럼
		
		//필수입력값
		//num은 쿼리문 호출시 selectkey로 받아옴
		//id는 컨트롤러에서 세션 비교해서 가져와서 넣어줌
		//areanum은 예약 버튼 눌렀을 때 DTO에 들어있는 내용
		
		//orderNum - 생성
		Long orderNum = campBookDAO.getOrderNumber();
		
		//생성한 orderNum을 orders table에 먼저 기입(부모키여서 먼저 넣어야함)
		campBookDTO.setOrderNum(orderNum);
		int result = campBookDAO.setOrderNumber(campBookDTO);
		
		
	}
	
	
}
