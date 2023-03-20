package com.camp.s1.camping;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.util.Pager;

@Repository
public class CampDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.camp.s1.camping.CampDAO.";
	
	//totalCount
	public Long getTotalCount(Pager pager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	//list
	public List<CampDTO> getCampList(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampList", pager);
	}
	
	//detail
	public CampDTO getCampDetail(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampDetail", campDTO);
	}
	
	//delete
	public int setCampDelete(CampDTO campDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampDelete", campDTO);
	}
	
	//add
	public int setCampAdd(CampDTO campDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampAdd", campDTO);
	}
		
	//update
	public int setCampUpdate(CampDTO campDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCampUpdate", campDTO);
	}
	
	//file
	//fileList
	public List<CampFileDTO> getCampFileList(CampDTO campDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampFileList", campDTO);
	}
	
	//fileAdd
	public int setCampFileAdd(CampFileDTO campFileDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampFileAdd", campFileDTO);
	}
	
	//fileDetail
	public CampFileDTO getCampFileDetail(CampFileDTO campFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampFileDetail", campFileDTO);
	}
	
	//fileDelete
	public int setCampFileDelete(Long fileNum) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampFileDelete", fileNum);
	}
	
	//site(option) - 디테일에서 캠프사이트를 가져올 것
	public List<CampSiteDTO> getCampSiteList(CampDTO campDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"CampSiteDTO", campDTO);
	}
	
	
}
