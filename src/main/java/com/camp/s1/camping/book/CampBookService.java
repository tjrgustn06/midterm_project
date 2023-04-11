package com.camp.s1.camping.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.payment.PaymentDTO;

@Service
public class CampBookService {

	@Autowired
	private CampBookDAO campBookDAO;
	
	
	//필요한 메서드 작성
	//campSite 가져오기
	public List<CampSiteDTO> getCampSiteList(CampDTO campDTO) throws Exception{
		List<CampSiteDTO> ar = campBookDAO.getCampSiteList(campDTO);
		return ar;
	}
	
	//예약 페이지 넘어갈때 site 정보 주기
	public CampSiteDTO getCampSiteDetail(Long areaNum) throws Exception{
		return campBookDAO.getCampSiteDetail(areaNum);
	}
	
	//예약 추가
	public int setCampBookAdd(CampBookDTO campBookDTO) throws Exception{
		//필수 입력값: num / areanum, id, indexcode, ordernum / 나머지 입력값
		
		//필수입력값
		//orderNum - 생성
		Long orderNum = campBookDAO.getOrderNumber();
		
		//생성한 orderNum을 orders table에 먼저 기입(부모키여서 먼저 넣어야함)
		campBookDTO.setOrderNum(orderNum);
		int result = campBookDAO.setOrderNumber(campBookDTO);
		//num은 쿼리문 호출시 selectkey로 받아옴
		//id는 컨트롤러에서 세션 가져와서 넣음, indexCode는 1로 입력

		//나머지 입력값 - 금액, 주문서작성일, 사용시작일, 사용종료일, 계좌번호, 결제상태
		//언급하지 않는 내용은 bookDTO에 들어가있을 것으로 예상되는 내용
		
		//금액 - javascript로 계산 / 주문서작성일 - sysdate / 사용시작,종료일 - web에서 입력 / 계좌번호 - service에서 임시세팅 / 결제상태 - web에서 입금대기로 입력
		campBookDTO.setIndexCode(1L);
		campBookDTO.setAccount("tmpAccount"); //일단 임시로 해둔 것
		
		//결과 보내기
		result = campBookDAO.setCampBookAdd(campBookDTO);
		return result;
	}
	
	//멤버 정보 조회
	public MemberDTO getMemberDetail(MemberDTO memberDTO) throws Exception{
		return campBookDAO.getMemberDetail(memberDTO);
	}
	
	//예약 사이트 리스트 조회
	public List<CampBookDTO> getCampBookList(Long campNum) throws Exception{
		return campBookDAO.getCampBookList(campNum);
	}
	
	//캠프장 정보 조회
	public CampDTO getCampDetail(Long campNum) throws Exception{
		return campBookDAO.getCampDetail(campNum);
	}
	
	//캠프장 예약 정보 한개 조회 - num으로 조회
	public CampBookDTO getCampBookDetail(CampBookDTO campBookDTO) throws Exception{
		return campBookDAO.getCampBookDetail(campBookDTO);
	}
	
	//예약 취소(삭제)
	public int setCampBookDelete(CampBookDTO campBookDTO) throws Exception{
		return campBookDAO.setCampBookDelete(campBookDTO);
	}
	
	//결제
	public int setCampBookPaymentAdd(PaymentDTO paymentDTO, CampBookDTO campBookDTO) throws Exception{
		//결제 진행하고 campbookDTO에 예약상태 변경시키기
		int result = campBookDAO.setCampBookPaymentAdd(paymentDTO);
		
		//결제 성공하면 예약상태 변경
		if(result>0) {
			result = campBookDAO.setCampBookUpdate(campBookDTO);
		}
		
		return result;
	}
	
}
