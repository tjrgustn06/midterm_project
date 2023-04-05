package com.camp.s1.camping.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;

@Repository
public class CampBookDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.camp.s1.camping.book.CampBookDAO.";
	
	
	//필요한 메서드 작성
	//siteList
	public List<CampSiteDTO> getCampBookSite(CampDTO campDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampBookSite", campDTO);
	}
	
	
}
