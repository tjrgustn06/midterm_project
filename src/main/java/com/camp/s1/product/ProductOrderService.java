package com.camp.s1.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductOrderService {
	
	@Autowired
	private ProductOrderDAO productOrderDAO;
	
	// Add 물품 예약 정보 입력
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO, ProductGradeDTO productGradeDTO) throws Exception {
		productOrderDTO.setOrderNum(productOrderDAO.getOrderNum());
		productOrderDTO.setGradeNum(productOrderDAO.getGradeNum(productGradeDTO));
		// session에서 id 뺴오기
		productOrderDTO.setId("user02");
		// grade의 금액*수량한값 넣기
		productOrderDTO.setPrice(8000L);
		productOrderDTO.setAddress("");
		return productOrderDAO.setProductOrderAdd(productOrderDTO);
	}

}
