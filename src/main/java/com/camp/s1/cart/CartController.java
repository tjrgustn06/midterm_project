package com.camp.s1.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView setCartAdd(CartDTO cartDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}

}
