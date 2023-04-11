package com.camp.s1.camping.book;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.payment.PaymentDTO;

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
	
	//회원정보 조회 - 로그인 세션에 id랑 주소만 추가되어 있음
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getMemberDetail", memberDTO);
	}
	
	//예약된 사이트 목록 조회 - CampSiteDTO
	public List<CampBookDTO> getCampBookList(Long campNum) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCampBookList", campNum);
	}
	
	//캠프장 정보 조회 - CampDTO
	public CampDTO getCampDetail(Long campNum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampDetail", campNum);
	}
	
	//캠프장 예약 정보 하나 조회 - CampBookDTO(parameter num으로)
	public CampBookDTO getCampBookDetail(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getCampBookDetail", campBookDTO);
	}
	
	//예약취소(삭제)
	public int setCampBookDelete(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"setCampBookDelete", campBookDTO);
	}
	
	//결제하기
	public int setCampBookPaymentAdd(PaymentDTO paymentDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setCampBookPaymentAdd", paymentDTO);
	}
	
	//결제 완료 후 예약상태 변경을 위한 업데이트.(결제 취소나 변경 등에도 사용할 수 있을거같음)
	public int setCampBookUpdate(CampBookDTO campBookDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"setCampBookUpdate", campBookDTO);
	}
	
}
