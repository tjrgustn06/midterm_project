package com.camp.s1.cart;

import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.member.MemberDTO;
import com.camp.s1.product.ProductGradeDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("list")
	public ModelAndView getCartList(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		mv.addObject("list", cartService.getCartList(memberDTO));
		mv.setViewName("cart/list");
		return mv;
	}
	
	@PostMapping("add")
	public ModelAndView setCartAdd(CartDTO cartDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		cartDTO.setId(memberDTO.getId());
		int result = cartService.setCartAdd(cartDTO);
		String msg = "추가 실패";
		if(result>0) {
			msg = "추가 성공";
		}
		mv.addObject("result", msg);
		mv.addObject("url", "../product/list");
		mv.setViewName("common/result");
		return mv;
	}
	
	@PostMapping("stockUpdate")
	public ModelAndView setStockUpdate(Long [] gradeNum, Integer [] amount, Long [] cartNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		ArrayList<CartDTO> cartDTOs = new ArrayList<CartDTO>();
		for(int i=0;i<gradeNum.length;i++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setGradeNum(gradeNum[i]);
			cartDTO.setAmount(amount[i]);
			cartDTO.setCartNum(cartNum[i]);
			cartDTOs.add(cartDTO);
		}
		int result = cartService.setStockUpdate(cartDTOs);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setCartDelete(CartDTO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("common/ajaxResult");
		mv.addObject("result", cartService.setCartDelete(cartDTO));
		
		return mv;
	}

}
