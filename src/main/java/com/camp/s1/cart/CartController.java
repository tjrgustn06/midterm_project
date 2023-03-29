package com.camp.s1.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.member.MemberDTO;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("list")
	public ModelAndView getCartList() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", cartService.getCartList());
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

}
