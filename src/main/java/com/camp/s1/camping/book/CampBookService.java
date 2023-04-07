package com.camp.s1.camping.book;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;

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
	public int setCampBookAdd(Long areaNum, CampBookDTO campBookDTO) throws Exception{
		//필수 입력값: num / areanum, id, indexcode, ordernum / 나머지 입력값
		
		//필수입력값
		//orderNum - 생성
		Long orderNum = campBookDAO.getOrderNumber();
		
		//생성한 orderNum을 orders table에 먼저 기입(부모키여서 먼저 넣어야함)
		campBookDTO.setOrderNum(orderNum);
		int result = campBookDAO.setOrderNumber(campBookDTO);
		//num은 쿼리문 호출시 selectkey로 받아옴
		//id는 컨트롤러에서 세션 가져와서 넣음, indexCode는 쿼리문에서 자동으로 1로 기입(변하지 않음)

		//나머지 입력값 - 요일정보, 금액, 예약날짜, 사용시작일, 사용종료일, 계좌번호, 결제상태
		//언급하지 않는 내용은 bookDTO에 들어가있을 것으로 예상되는 내용
		
		//요일정보 계산 - 금액 계산을 위해서 써야할 요일정보 계산
		//dayInfo 값 구해서 컬럼에 넣기 -> list여야 할거같음 / 컬럼에 넣을거 없이 구분만 하고 금액계산을 해도 되긴한데...
		
		//금액은 요일 계산해서 금액값에 입력해주기(if~ 또는 switch~) - 임시로 평일주중요금으로만 나오게
		CampSiteDTO campSiteDTO = campBookDAO.getCampSiteDetail(areaNum);
		campBookDTO.setPrice(campSiteDTO.getOffWeekdaysPrice());
		
		
		//bookDTO에 들어가있을 것으로 예상되는 내용
		campBookDTO.setAreaNum(campSiteDTO.getAreaNum());
		campBookDTO.setAccount("tmpAccount"); //일단 임시로 해둔 것
		
		//결과 보내기
		result = campBookDAO.setCampBookAdd(campBookDTO);
		return result;
	}
	
	//요금 계산을 위한 날짜 계산 메서드
	public List<Integer> getDayOfWeek(String startDate, String lastDate) throws Exception{
		List<Integer> ar = new ArrayList<Integer>();
		
		//시작날짜, 끝날짜로 기간 구하기(날짜 리스트?로 표시해야하나)
		//리스트에 해당하는 날짜마다 요일 구하고, 요일이 주중인지 주말인지 계산함
		//계산한 결과를 리스트에 넣어주고 반환? 아니면 반환전에 가격 불러와서 곱하기
		
		SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");
		
		
		//date class를 이용하여 구현(java.util.Date)
//		SimpleDateFormat time = new SimpleDateFormat("yyyy-mm-dd");
//		
//		Date startParseDate = time.parse(startDate);
//		Date lastParseDate = time.parse(lastDate);
		
		
		return ar;
	}
	
	
}
