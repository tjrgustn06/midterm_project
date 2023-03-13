package com.camp.s1.product;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;

public class ProductDAOTest extends MyTestCase {

	@Autowired
	private ProductDAO productDAO;
	
	@Test
	public void getProductListTest() throws Exception {
		List<ProductDTO> ar = productDAO.getProductList();
		assertNotEquals(0, ar.size());
	}

}
