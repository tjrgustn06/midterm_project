package com.camp.s1.camping.book;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;
import com.camp.s1.member.AddressDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.payment.PaymentDTO;
import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/camp/book/*")
public class CampBookController {

	@Autowired
	private CampBookService campBookService;
	
	
	//필요한 메서드 작성
	
	//예약페이지(book.jsp) 호출
	@GetMapping("site")
	public ModelAndView getCampSiteList(CampDTO campDTO) throws Exception{
		//사이트 고르고, 기간 설정, 예약가능 사이트 확인, 금액 확인, 예약하기 기능 제공
		ModelAndView mv = new ModelAndView();
		
		//캠프장의 모든 사이트를 보내줘야한다
		List<CampSiteDTO> siteList = campBookService.getCampSiteList(campDTO);
		
		//해당 캠핑장의 정보를 조회한다.
		campDTO = campBookService.getCampDetail(campDTO.getCampNum());
		
		mv.addObject("campDTO", campDTO);
		mv.addObject("siteList", siteList);
		mv.setViewName("camp/book/bookSite");
		return mv;
	}
	
	
	//booking 버튼을 눌렀을 때(site -> confirmation page로 이동)
	//예약확정페이지(bookConfirmation.jsp) 호출
	@GetMapping("confirmation")
	public ModelAndView getCampBookAdd(HttpSession session, Long areaNum, String startDate, String lastDate) throws Exception{
		//campSiteDetail 호출 + 날짜 입력되서 넘어가게끔
		ModelAndView mv = new ModelAndView();
		
		//로그인 정보 가져오기
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = campBookService.getMemberDetail(memberDTO);
		//System.out.println(memberDTO.getName());
		
		//site정보 보내주기
		CampSiteDTO campSiteDTO = campBookService.getCampSiteDetail(areaNum);
		//DB에 저장은 안하는데 일단 필요하니까;... 날짜 저장은 예약되는때에
		campSiteDTO.setStartDate(startDate);
		campSiteDTO.setLastDate(lastDate);
		
		//site정보로 해당 캠핑장의 정보를 조회
		CampDTO campDTO = campBookService.getCampDetail(campSiteDTO.getCampNum());
		
		
		//선택한 사이트의 정보를 CampBookDTO 형태로 만들어서 confirmation 페이지로 넘겨준다. - 계약서를 만드는 느낌으로
		//이렇게 보내면 bookConfirmation page에 campSiteDTO 정보가 나오게됨 - CampSiteDTO 조회해서 bookDTO에 저장하고 보내도 괜찮을려나
		mv.addObject("dto", memberDTO);
		mv.addObject("campDTO", campDTO);
		mv.addObject("siteDTO", campSiteDTO);
		mv.setViewName("camp/book/bookConfirmation");
		return mv;
	}
	
	
	//booking 버튼을 눌렀을 때(confirmation 확정 또는 취소)
	@PostMapping("confirmation")
	public ModelAndView getCampBookAdd(CampBookDTO campBookDTO, HttpSession session, Long campNum) throws Exception{
		//예약 정보 표시, 최종 결제, 예약취소 기능 제공
		ModelAndView mv = new ModelAndView();
		
		//멤버정보 가져오기
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		campBookDTO.setId(memberDTO.getId());
		
		//CampBookAdd 메서드 호출해서 CampBookDTO 만들기
		//ModelAndView에 CampBookDTO가 담기게끔 해야하고, 매개변수는 CampSite, CampDTO, member가 있어야 할거같긴함. member는 session에서 가져오는식으로(id 따와야 하니까)
		//add에 성공하면 예약을 한 것이고, 결제페이지에서 결제하면 결제api 호출, 성공하면 결제완료로 status 변경.
		
		int result = campBookService.setCampBookAdd(campBookDTO);
		
		String message = "예약에 실패했습니다";
		if(result>0) {
			message = "예약에 성공했습니다";
		}
		
		//멤버에 예약한 캠핑장의 주소넣기 - 물품대여할 때 필요
		AddressDTO addressDTO = new AddressDTO();
		CampDTO campDTO = campBookService.getCampDetail(campNum);
		addressDTO.setAddress(campDTO.getAddress());
		addressDTO.setAddressName(campDTO.getCampName());
		memberDTO.getAddressDTOs().add(addressDTO);
		
		
		mv.addObject("result", message);
		mv.addObject("url", "../book/payment?num="+campBookDTO.getNum());
		mv.setViewName("common/result");
		
		return mv;
	}
	
	
	//예약목록페이지(bookList.jsp) 호출
	//해당 캠핑장의 사이트 예약목록을 불러옴
	@GetMapping("list")
	public ModelAndView getCampBookList(Long campNum) throws Exception{
		//해당 캠핑장에서 예약된 사이트 전체를 보여주는 페이지. [사이트이름 / 사용기간 / 결제여부(입금대기,완료 등)]
		ModelAndView mv = new ModelAndView();
		
		//예약된 캠핑장 사이트의 목록을 보여주는 페이지(관리자용)
		List<CampBookDTO> bookList = campBookService.getCampBookList(campNum);
		
		//캠핑장 정보 조회
		CampDTO campDTO = campBookService.getCampDetail(campNum);
		
		mv.addObject("campDTO", campDTO);
		mv.addObject("bookList", bookList);
		mv.setViewName("camp/book/bookList");
		return mv;
	}
	
	
	//예약 취소
	@PostMapping("delete")
	public ModelAndView setCampBookDelete(CampBookDTO campBookDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//CampBookDTO로 site 조회
		CampSiteDTO campSiteDTO = campBookService.getCampSiteDetail(campBookDTO.getAreaNum());
		
		//campSiteDTO로 camp 조회
		CampDTO campDTO = campBookService.getCampDetail(campSiteDTO.getCampNum());
		
		//삭제실행
		int result = campBookService.setCampBookDelete(campBookDTO);
		
		//결과출력
		String message = "예약 정보를 삭제하지 못했습니다.";
		if(result>0) {
			message = "예약 정보를 삭제했습니다.";
		}
		
		mv.setViewName("common/result");
		mv.addObject("result", message);
		mv.addObject("url", "../detail?campNum="+campDTO.getCampNum()+"&viewType=1");
		
		return mv;
	}
	
	
	//결제 페이지(bookPayment.jsp) 호출
	@GetMapping("payment")
	public ModelAndView setCampBookPaymentAdd(CampBookDTO campBookDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//num(pk)로 CampBookDTO 조회해오기 - 페이지에서 CampBookDTO 하나를 뿌려줘야한다
		campBookDTO = campBookService.getCampBookDetail(campBookDTO);
		
		//CampBookDTO로 site 조회
		CampSiteDTO campSiteDTO = campBookService.getCampSiteDetail(campBookDTO.getAreaNum());
		
		//campSiteDTO로 camp 조회
		CampDTO campDTO = campBookService.getCampDetail(campSiteDTO.getCampNum());
		
		
		mv.addObject("bookDTO", campBookDTO);
		mv.addObject("campDTO", campDTO);
		mv.addObject("siteDTO", campSiteDTO);
		mv.setViewName("camp/book/bookPayment");
		return mv;
	}
	
	
	//결제 진행
	@PostMapping("payment")
	public ModelAndView setCampBookPaymentAdd(HttpSession session, CampBookDTO campBookDTO, PaymentDTO paymentDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO.setId(memberDTO.getId());
		
		//CampBookDTO로 site 조회
		CampSiteDTO campSiteDTO = campBookService.getCampSiteDetail(campBookDTO.getAreaNum());
		
		int result = campBookService.setCampBookPaymentAdd(paymentDTO, campBookDTO);
		
		mv.setViewName("redirect:/camp/detail?campNum="+campSiteDTO.getCampNum()+"&viewType=1");
		
		return mv;
	}
	
	
	//특정 기간에 에약이 없는 모든 사이트 조회 - ajax
	@PostMapping("availableSite")
	public ModelAndView getAvailbleSiteList(CampDTO campDTO, String searchStartDate, String searchLastDate) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<CampSiteDTO> availableSiteList = campBookService.getAvailbleSiteList(campDTO, searchStartDate, searchLastDate);
		
		mv.addObject("siteList", availableSiteList);
		mv.setViewName("common/availableSiteList");
		return mv;
	}
	
	
	//멤버의 예약 페이지(myBook.jsp) 호출
	//특정 멤버의 예약서 목록을 조회
	@GetMapping("myBook")
	public ModelAndView getMyBookList(HttpSession session, CampBookDTO campBookDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//id정보밖에 없어서 회원정보 넣어주기
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		memberDTO = campBookService.getMemberDetail(memberDTO);
		
		campBookDTO.setId(memberDTO.getId());	
		
		List<CampBookDTO> myList = campBookService.getMyBookList(campBookDTO);
		
		
//		List<CampSiteDTO> siteList = new ArrayList<CampSiteDTO>();
//		//bookDTO로 CampSiteDTO 정보 조회
//		for(CampBookDTO campBook : myList) {
//			CampSiteDTO campSiteDTO = campBookService.getCampSiteDetail(campBook.getAreaNum());
//			siteList.add(campSiteDTO);
//		}
		
		mv.addObject("member", memberDTO);
		mv.addObject("bookList", myList);
//		mv.addObject("siteList", siteList);
		mv.setViewName("camp/book/myBook");
		return mv;
	}
	
	
}
