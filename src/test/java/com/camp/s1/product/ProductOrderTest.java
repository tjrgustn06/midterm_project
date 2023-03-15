package com.camp.s1.product;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;

public class ProductOrderTest extends MyTestCase{

	@Autowired
	private productOrderDAO productOrderDAO;
	
	@Test
	public void productOrderAddTest() throws Exception {
		ProductOrderDTO productOrderDTO = new ProductOrderDTO();
		productOrderDTO.setGradeNum(42L);
		productOrderDTO.setId("test");
		productOrderDTO.setIndexCode(2L);
		productOrderDTO.setOrderNum(1L);
		productOrderDTO.setPrice(5000L);
		ProductOrderDTO.setamo
	}

}
