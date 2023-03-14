package com.camp.s1.camping;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CampDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.camp.s1.camping.CampDAO.";
	
	//list
	public List<CampDTO> getCampList() throws Exception{
		System.out.println("Dao:"+sqlSession.selectList(NAMESPACE+"getCampList").size());
		return sqlSession.selectList(NAMESPACE+"getCampList");
	}
	
	
}
