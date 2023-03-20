package com.camp.s1.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.util.Pager;

@Service
public class ProductOrderService {
	
	@Autowired
	private ProductOrderDAO productOrderDAO;
	
	// Add 물품 예약 정보 입력
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO) throws Exception {
		productOrderDTO.setOrderNum(productOrderDAO.getOrderNum());
		int result = productOrderDAO.setOrderNum(productOrderDTO);
		// session에서 id 뺴오기
		productOrderDTO.setId("user01");
		productOrderDTO.setAddress("");
		return productOrderDAO.setProductOrderAdd(productOrderDTO);
	}
	
	// Order List 출력
	public List<ProductOrderDTO> getProductOrderList(Pager pager) throws Exception {
		pager.setPerPage(10L);
		pager.makeRow();
		pager.makeNum(productOrderDAO.getTotalCount(pager));
		return productOrderDAO.getProductOrderList(pager);
		
		
	}

	// Detail 주문 페이지
	public ProductOrderDTO getProductOrderDetail(ProductOrderDTO productOrderDTO) throws Exception {
		return productOrderDAO.getProductOrderDetail(productOrderDTO);
	}
	
	// payment 주문 결제
	public int setProductOrderPayment(ProductOrderDTO productOrderDTO) throws Exception {
		return productOrderDAO.setProductOrderPayment(productOrderDTO);
	}
	
}
