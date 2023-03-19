package com.camp.s1.product;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;
import com.camp.s1.product.order.ProductOrderDAO;
import com.camp.s1.product.order.ProductOrderDTO;

public class ProductOrderTest extends MyTestCase{

	@Autowired
	private ProductOrderDAO productOrderDAO;
	
	@Test
	public void productOrderAddTest() throws Exception {
		ProductOrderDTO productOrderDTO = new ProductOrderDTO();
		productOrderDTO.setGradeNum(42L);
		productOrderDTO.setId("user01");
		productOrderDTO.setIndexCode(2L);
		productOrderDTO.setOrderNum(1L);
		productOrderDTO.setPrice(5000L);
		productOrderDTO.setAmount(1L);
		productOrderDTO.setAddress("우리집");
		productOrderDTO.setOrderer("나");
		int result =productOrderDAO.setProductOrderAdd(productOrderDTO);
		
		assertNotEquals(0, result);
	}

}
