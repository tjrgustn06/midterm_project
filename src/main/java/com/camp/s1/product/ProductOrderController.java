package com.camp.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/product/order/*")
public class ProductOrderController {
	
	@Autowired
	private ProductOrderService productOrderService;
	
	// order List 출력
	@GetMapping("list")
	public ModelAndView getProductOrderList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductOrderDTO> ar = productOrderService.getProductOrderList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("product/order/list");
		return mv;
		
	}
	
	//Add 주문 정보 입력
	@PostMapping("order")
	public ModelAndView setProductOrderAdd(ProductOrderDTO productOrderDTO, ProductGradeDTO productGradeDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		
		//int result = productOrderService.setProductOrderAdd(productOrderDTO, productGradeDTO);
		mv.setViewName("redirect:list");
		return mv;
	}

}
