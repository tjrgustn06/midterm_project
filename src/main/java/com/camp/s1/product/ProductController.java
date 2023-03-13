package com.camp.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	//List 출력
	@GetMapping("list")
	public ModelAndView getProductList() throws Exception {
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> ar = productService.getProductList();
		mv.addObject("list", ar);
		mv.setViewName("product/list");
		return mv;
	}

}
