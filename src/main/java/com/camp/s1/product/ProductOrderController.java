package com.camp.s1.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/order/*")
public class ProductOrderController {
	
	@Autowired
	private ProductOrderService productOrderService;
	
	@GetMapping("order")
	public ModelAndView setProductOrderPage() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/order/order");
		return mv;
		
	}
	
	@PostMapping("order")
	public ModelAndView setProductOrderAdd(ProductOrderDTO productOrderDTO, ProductGradeDTO productGradeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		//int result = productOrderService.setProductOrderAdd(productOrderDTO, productGradeDTO);
		mv.setViewName("redirect:order");
		return mv;
	}

}
