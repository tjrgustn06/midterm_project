package com.camp.s1.camping.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.camping.CampDTO;
import com.camp.s1.camping.CampSiteDTO;
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
		List<CampSiteDTO> ar = campBookService.getCampSiteList(campDTO);
		
		//선택한 사이트의 정보를 CampBookDTO 형태로 만들어서 confirmation 페이지로 넘겨준다. - 계약서를 만드는 느낌으로
		
		
		mv.addObject("siteList", ar);
		mv.setViewName("camp/book/bookSite");
		return mv;
	}
	
	
	//booking 버튼을 눌렀을 때
	//예약확정페이지(bookConfirmation.jsp) 호출
	@GetMapping("confirmation")
	public ModelAndView getCampBookConfirmation(CampSiteDTO campSiteDTO) throws Exception{
		//campSiteDetail 호출 + 날짜 입력되서 넘어가게끔
		ModelAndView mv = new ModelAndView();
		
		//
		
		mv.setViewName("camp/book/bookConfirmation");
		return mv;
	}
	
	
	//booking 버튼을 눌렀을 때
	@PostMapping("confirmation")
	public ModelAndView getCampBookConfirmation() throws Exception{
		//예약 정보 표시, 최종 결제, 예약취소 기능 제공
	}
	
	
	
	//예악관리페이지(bookManagement.jsp) 호출
	@GetMapping("management")
	public ModelAndView getCampBookManagement(CampDTO campDTO) throws Exception{
		//사이트 정보 수정(추가/수정/삭제, 예약가능여부(중복x), 금액 변동 등) 기능 제공 -> 글수정 할 때 가능하게 했던 내용들이긴 해서 참고하고 수정할 수 있도록
		ModelAndView mv = new ModelAndView();
		
		
		
		mv.setViewName("camp/book/bookManagement");
		return mv;
	}
	
	
	
	//예약목록페이지(bookList.jsp) 호출
	@GetMapping("list")
	public ModelAndView getCampBookList() throws Exception{
		//해당 캠핑장에서 예약된 사이트 전체를 보여주는 페이지. [사이트이름 / 사용기간 / 결제여부(입금대기,완료 등)]
		ModelAndView mv = new ModelAndView();
		
		
		
		mv.setViewName("camp/book/bookList");
		return mv;
	}
	
	
}
