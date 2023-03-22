package com.camp.s1.product.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.member.MemberDTO;
import com.camp.s1.product.ProductGradeDTO;
import com.camp.s1.util.Pager;

@Service
public class ProductOrderService {
	
	@Autowired
	private ProductOrderDAO productOrderDAO;
	
	// Add 물품 예약 정보 입력
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO) throws Exception {
		// 주문번호 생성
		productOrderDTO.setOrderNum(productOrderDAO.getOrderNumber());
		int result = productOrderDAO.setOrderNumber(productOrderDTO);
		productOrderDTO.setAddress("");
		result =productOrderDAO.setProductOrderAdd(productOrderDTO);
		String gradeName=productOrderDTO.getName();
		gradeName=gradeName.substring(gradeName.lastIndexOf("급")-1);
		ProductGradeDTO productGradeDTO = new ProductGradeDTO();
		productGradeDTO.setGradeName(gradeName);
		productGradeDTO.setGradeNum(productOrderDTO.getGradeNum());
		productGradeDTO.setGradeStock(productOrderDAO.getGradeStock(productGradeDTO).getGradeStock()-productOrderDTO.getAmount());
		result = productOrderDAO.setGradeStockUpdate(productGradeDTO);
		return result;
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
