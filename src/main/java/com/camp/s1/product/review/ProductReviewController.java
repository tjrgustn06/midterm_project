package com.camp.s1.product.review;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/product/review/*")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@ModelAttribute("boardName")
	public String getBoardName() {
		return "ProductReview";
	}
	
	@GetMapping("list")
	public ModelAndView getBoardList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/list");
		
		mv.addObject("list", productReviewService.getBoardList(pager));
		return mv;
	}
	
	@GetMapping("detail")
	public ModelAndView getBoardDetail(ProductReviewDTO productReviewDTO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/detail");
		mv.addObject("dto", productReviewService.getBoardDetail(productReviewDTO));
		
		// 조회수
		// request에서 cookie를 꺼냄
		Cookie oldCookie = null;
		Cookie [] cookies = request.getCookies();
		
		// cookie가 null이 아니고 boardView란 이름의 쿠키가 존재할 때
		if(cookies != null) {
			for(Cookie cookie:cookies) {
				if(cookie.getName().equals("boardView")) {
					oldCookie=cookie;
				}
			}
		}
		
		// cookie가 존재할때
		// cookie의 값 중에 글번호를 포함하고 있지 않을 때
		if(oldCookie != null) {
			if(!oldCookie.getValue().contains("["+productReviewDTO.getNum()+"]")) {
				oldCookie.setValue("["+productReviewDTO.getNum()+"]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60*60*24);
				productReviewService.setBoardHitCount(productReviewDTO);
				response.addCookie(oldCookie);
			}
		}
		
		// cookie가 존재하지 않을 때
		// boardView란 이름의 새로운 cookie 생성
		// 값은 [글번호]
		else {
			Cookie newCookie = new Cookie("boardView", "["+productReviewDTO.getNum()+"]");
			newCookie.setMaxAge(60*60*24);
			newCookie.setPath("/");
			productReviewService.setBoardHitCount(productReviewDTO);
			response.addCookie(newCookie);
		}
		
		
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView setBoardAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("board/add");
		
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(ProductReviewDTO productReviewDTO, MultipartFile [] files, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		
		
		return mv;
	}

}
