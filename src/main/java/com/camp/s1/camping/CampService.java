package com.camp.s1.camping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.util.Pager;

@Service
public class CampService {

	@Autowired
	private CampDAO campDAO;
	
	//list
	public List<CampDTO> getCampList(Pager pager) throws Exception{
		//pagination
		pager.makeRow();
		Long count = campDAO.getTotalCount(pager);
		pager.makeNum(count);
		
		List<CampDTO> ar = campDAO.getCampList(pager);
		return ar;
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return campDAO.getCampDetail(campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		//나중에 파일추가되면 파일도 삭제하는 기능 필요
		return campDAO.setCampDelete(campDTO);
	}
	
	//add
	public int setCampAdd(CampDTO campDTO) throws Exception{
		return campDAO.setCampAdd(campDTO);
	}
		
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return campDAO.setCampUpdate(campDTO);
	}
}
