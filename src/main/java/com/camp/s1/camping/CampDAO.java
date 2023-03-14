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
		return sqlSession.selectList(NAMESPACE+"getCampList");
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampDetail", campDTO);
	}
	
	//add
	public int setCampAdd(CampDTO campDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampAdd", campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampDelete", campDTO);
	}
	
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCampUpdate", campDTO);
	}
	
	//site(option)
	
	
	
}
