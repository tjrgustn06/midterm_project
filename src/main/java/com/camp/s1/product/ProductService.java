package com.camp.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	// List출력
	public List<ProductDTO> getProductList() throws Exception {
		return productDAO.getProductList();
	}
	
	// Detail 상세페이지 출력
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		return productDAO.getProductDetail(productDTO);
	}
	
	// Add 물품 추가
	public int setProductAdd(ProductDTO productDTO) throws Exception {
		return productDAO.setProductAdd(productDTO);
	}
	
	// Update 물품 수정
	public int setProductUpdate(ProductDTO productDTO) throws Exception {
		return productDAO.setProductUpdate(productDTO);
	}

}
