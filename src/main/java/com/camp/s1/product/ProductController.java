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
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// List 출력
	@GetMapping("list")
	public ModelAndView getProductList(Pager pager) throws Exception {
		System.out.println(pager.getNum());
		ModelAndView mv = new ModelAndView();
		List<ProductDTO> ar = productService.getProductList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("product/list");
		return mv;
	}
	
	// Detail 상세페이지 출력
	@GetMapping("detail")
	public ModelAndView getProductDetail(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productDTO = productService.getProductDetail(productDTO);
		mv.addObject("dto", productDTO);
		mv.setViewName("product/detail");
		
		return mv;
	}
	
	// Add 상품 추가 GET
	@GetMapping("add")
	public ModelAndView setProductAdd() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("product/add");
		return mv;
	}
	
	// Add 상품 추가 POST
	@PostMapping("add")
	public ModelAndView setProductAdd(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setProductAdd(productDTO);
		mv.setViewName("redirect:list");
		
		return mv;
	}
	
	// Update 상품 수정 GET
	@GetMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productDTO = productService.getProductDetail(productDTO);
		mv.addObject("dto", productDTO);
		mv.setViewName("product/update");
		return mv;
	}
	
	// Update 상품 수정 POST
	@PostMapping("update")
	public ModelAndView setProductUpdate(ProductDTO productDTO, ModelAndView mv) throws Exception {
		int result = productService.setProductUpdate(productDTO);
		mv.setViewName("product/detail?productNum="+productDTO.getProductNum());
		
		return mv;
	}
	
	// Delete 상품 삭제
	@PostMapping("delete")
	public ModelAndView setProductDelete(ProductDTO productDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productService.setProductDelete(productDTO);
		mv.setViewName("redirect:list");
		return mv;
	}
	

}
