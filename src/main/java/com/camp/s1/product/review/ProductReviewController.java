package com.camp.s1.product.review;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.member.MemberDTO;

@Controller
@RequestMapping("/product/review/*")
public class ProductReviewController {
	
	@Autowired
	private ProductReviewService productReviewService;
	
	@PostMapping("add")
	public ModelAndView setBoardAdd(ProductReviewDTO productReviewDTO, MultipartFile [] pics, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(pics.length);
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productReviewDTO.setWriter(memberDTO.getId());
		mv.addObject("result", productReviewService.setBoardAdd(productReviewDTO, pics, session));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
}
