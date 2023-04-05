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
	public List<CampSiteDTO> getCampBookSite(CampDTO campDTO) throws Exception{
		List<CampSiteDTO> ar = campBookDAO.getCampBookSite(campDTO);
		
		
		
		return ar;
	}
	
}
