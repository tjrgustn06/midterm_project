package com.camp.s1.camping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CampService {

	@Autowired
	private CampDAO campDAO;
	
	//list
	public List<CampDTO> getCampList() throws Exception{
		List<CampDTO> ar = campDAO.getCampList();
		return ar;
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return campDAO.getCampDetail(campDTO);
	}
	
	//add
	public int setCampAdd(CampDTO campDTO) throws Exception{
		return campDAO.setCampAdd(campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		return campDAO.setCampDelete(campDTO);
	}
	
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return campDAO.setCampUpdate(campDTO);
	}
}
