package com.camp.s1.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.cart.CartDTO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// List 출력
	@GetMapping("list")
	public ModelAndView getProductList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.setPerPage(12L);
		List<ProductDTO> ar = productService.getProductList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("product/list");
		return mv;
	}
	
	// CartBar 출력
		@GetMapping("cartBar")
		public ModelAndView getcartBarList(Pager pager, HttpSession session) throws Exception {
			ModelAndView mv = new ModelAndView();
			pager.setPerPage(2L);
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO==null) {
				mv.addObject("cartList", memberDTO);
				mv.setViewName("common/cartList");
				return mv;
			}
			pager.setId(memberDTO.getId());
			List<CartDTO> ar = productService.getCartBarList(pager);
			
			mv.addObject("cartList", ar);
			mv.setViewName("common/cartList");
			return mv;
		}
	
	// home에서 평점에 따른 리스트4개 출력
	@GetMapping("productListTop")
	public ModelAndView getProductListTop(Pager pager) throws Exception {
		ModelAndView mv =new ModelAndView();
		List<ProductDTO> ar = productService.getProductList(pager);
		mv.addObject("list", ar);
		mv.setViewName("common/productTopResult");
		
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
	public ModelAndView setProductAdd(ProductDTO productDTO, String [] gradeName, Integer [] gradeStock, Long [] price, MultipartFile [] addFiles, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		ArrayList<ProductGradeDTO> productGradeDTOs = new ArrayList<ProductGradeDTO>();
		for (int i = 0;i<gradeName.length;i++) {
			ProductGradeDTO productGradeDTO = new ProductGradeDTO();
			productGradeDTO.setGradeName(gradeName[i]);
			productGradeDTO.setGradeStock(gradeStock[i]);
			productGradeDTO.setPrice(price[i]);
			productGradeDTOs.add(productGradeDTO);
		}
		productDTO.setProductGradeDTOs(productGradeDTOs);
		int result = productService.setProductAdd(productDTO, addFiles, session);
		
		String msg = "등록 실패";
		
		if(result>0) {
			msg = "등록 성공";
		}
		
		mv.addObject("result", msg);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		
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
	public ModelAndView setProductUpdate(ProductDTO productDTO, String [] gradeName, Integer [] gradeStock, Long [] price, MultipartFile [] addFiles, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println(productDTO.getSummary());
		ArrayList<ProductGradeDTO> productGradeDTOs = new ArrayList<ProductGradeDTO>();
		for (int i = 0;i<gradeName.length;i++) {
			ProductGradeDTO productGradeDTO = new ProductGradeDTO();
			productGradeDTO.setGradeName(gradeName[i]);
			productGradeDTO.setGradeStock(gradeStock[i]);
			productGradeDTO.setPrice(price[i]);
			productGradeDTOs.add(productGradeDTO);
		}
		productDTO.setProductGradeDTOs(productGradeDTOs);
		int result = productService.setProductUpdate(productDTO, addFiles, session);
		
		String msg = "수정 실패";
		if(result > 0) {
			msg = "수정이 완료되었습니다";
		}
		mv.setViewName("common/result");
		mv.addObject("result", msg);
		mv.addObject("url", "./detail?productNum="+productDTO.getProductNum());
		
		return mv;
	}
	
	@PostMapping("boardFileDelete")
	public ModelAndView setProductFileDelete(Long fileNum) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", productService.setProductFileDelete(fileNum));
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// Delete 상품 삭제
	@PostMapping("delete")
	public ModelAndView setProductDelete(ProductDTO productDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		 mv.setViewName("common/ajaxResult");
		 mv.addObject("result", productService.setProductDelete(productDTO, session));
		return mv;
	}

}
