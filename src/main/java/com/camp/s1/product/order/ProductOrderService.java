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
	
	// cartOrder 장바구니 주문
	public int setCartOrderAdd(ProductOrderDTO productOrderDTO) throws Exception {
		productOrderDTO.setOrderNum(productOrderDAO.getOrderNumber());
		int result = productOrderDAO.setOrderNumber(productOrderDTO);
		productOrderDTO.setAddress("");
		result = productOrderDAO.setProductOrderAdd(productOrderDTO);
		return result;
	}
	
	// Order List 출력
	public List<ProductOrderDTO> getProductOrderList(Pager pager) throws Exception {
		pager.setPerPage(10L);
		pager.makeRow();
		pager.makeNum(productOrderDAO.getTotalCount(pager));
		List<ProductOrderDTO> ar = productOrderDAO.getProductOrderList(pager);
		for(ProductOrderDTO productOrderDTO:ar) {
			productOrderDTO.setStartDate(productOrderDTO.getStartDate().substring(0, 10));
			productOrderDTO.setLastDate(productOrderDTO.getLastDate().substring(0, 10));
		}
		return ar;
		
		
	}

	// Detail 주문 페이지
	public ProductOrderDTO getProductOrderDetail(ProductOrderDTO productOrderDTO) throws Exception {
		return productOrderDAO.getProductOrderDetail(productOrderDTO);
	}
	
	// payment 주문 결제
	public int setProductOrderPayment(ProductOrderDTO productOrderDTO) throws Exception {
		return productOrderDAO.setProductOrderPayment(productOrderDTO);
	}
	
	// delete 주문 취소
	public int setProductOrderDelete(ProductOrderDTO productOrderDTO) throws Exception {
		int result = productOrderDAO.setProductOrderDelete(productOrderDTO);
		String orderNames[]=productOrderDTO.getName().split("개");
		String gradeName = "";
		if(orderNames.length==1) {
			gradeName=productOrderDTO.getName();
			gradeName=gradeName.substring(gradeName.lastIndexOf("급")-1);
			ProductGradeDTO productGradeDTO = new ProductGradeDTO();
			productGradeDTO.setGradeName(gradeName);
			productGradeDTO.setGradeNum(productOrderDTO.getGradeNum());
			productGradeDTO=productOrderDAO.getGradeStock(productGradeDTO);
			productGradeDTO.setGradeStock(productGradeDTO.getGradeStock()+productOrderDTO.getAmount());
			result=productOrderDAO.setGradeStockUpdate(productGradeDTO);
			return result;
		}
		for(String orderName:orderNames) {
			System.out.println(orderName);
			Long gradeNum=Long.parseLong(orderName.substring(0,orderName.indexOf(".")));
			productOrderDTO.setGradeNum(gradeNum);
			gradeName=orderName.substring(orderName.lastIndexOf("급")-1,orderName.lastIndexOf("급")+1);
			Integer amount=Integer.parseInt(orderName.substring(orderName.lastIndexOf("급")+1));
			productOrderDTO.setAmount(amount);
			ProductGradeDTO productGradeDTO = new ProductGradeDTO();
			productGradeDTO.setGradeName(gradeName);
			productGradeDTO.setGradeNum(productOrderDTO.getGradeNum());
			productGradeDTO=productOrderDAO.getGradeStock(productGradeDTO);
			productGradeDTO.setGradeStock(productGradeDTO.getGradeStock()+productOrderDTO.getAmount());
			result=productOrderDAO.setGradeStockUpdate(productGradeDTO);
		}
		
		return result;
	}
	
}
