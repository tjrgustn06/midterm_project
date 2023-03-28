package com.camp.s1.product.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/product/review/*")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@ModelAttribute("reviewName")
	public String getBoardName() {
		return "productReview";
	}
	
	@GetMapping("list")
	public ModelAndView getReviewList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("reviewList", productReviewService.getBoardList(pager));
		mv.setViewName("common/reviewList");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setReviewAdd(ProductReviewDTO productReviewDTO, MultipartFile [] pics, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productReviewDTO.setWriter(memberDTO.getId());
		mv.addObject("result", productReviewService.setBoardAdd(productReviewDTO, pics, session));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setReviewUpdate(ProductReviewDTO productReviewDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productReviewService.setBoardUpdate(productReviewDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setReviewDelete(ProductReviewDTO productReviewDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productReviewService.setBoardDelete(productReviewDTO, session);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	
}
