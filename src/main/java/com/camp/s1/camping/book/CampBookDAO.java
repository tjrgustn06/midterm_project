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
	
	//booking 한 site 불러오기
	public CampSiteDTO getCampSiteDetail(Long areaNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampSiteDetail", areaNum);
	}
	
	//사용자
	//bookAdd(CampBookDTO 생성)
	public int setCampBookAdd(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampBookAdd", campBookDTO);
	}
	
	//주문번호 생성
	public Long getOrderNumber() throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getOrderNumber");
	}
	
	//주문번호 입력 - 이걸 먼저 해야 주문서에 orderNum을 받아올 수 있음
	public int setOrderNumber(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setOrderNumber", campBookDTO);
	}
	
	//요일 계산하는 쿼리 결과 받아오기 - bookAdd
	public List<Long> getDayOfWeek(CampSiteDTO campSiteDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getDayOfWeek", campSiteDTO);
	}
	
	
	
	//bookConfirmed - bookConfirmation.jsp에서 최종 확인한 경우
	
	
	//bookDelete - bookConfirmation.jsp에서 취소한 경우
	
	
}
