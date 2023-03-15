package com.camp.s1.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductOrderService {
	
	@Autowired
	private productOrderDAO productOrderDAO;
	
	// Add 물품 예약 정보 입력
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO) throws Exception {
		return productOrderDAO.setProductOrderAdd(productOrderDTO);
	}

}
