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
	//캠핑장의 모든 site 불러오기
	public List<CampSiteDTO> getCampSiteList(CampDTO campDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampSiteList", campDTO);
	}
	
	//사용자
	//bookAdd(CampBookDTO 생성)
	public int setCampBookAdd(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampBookAdd", campBookDTO);
	}
	
	//주문번호 생성
	public Long getOrderNum() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderNum");
	}
	
	//주문번호 입력 - 주문관리 테이블
	public int setOrderNum(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderNum", campBookDTO);
	}
	
}
