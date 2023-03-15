package com.camp.s1.product;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTestCase;
import com.camp.s1.util.Pager;

public class ProductDAOTest extends MyTestCase {

	@Autowired
	private ProductDAO productDAO;
	
	@Test
	public void getProductListTest() throws Exception {
		Pager pager = new Pager();
		List<ProductDTO> ar = productDAO.getProductList(pager);
		assertNotEquals(0, ar.size());
	}

	@Test
	public void getProductDetailTest() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(2L);
		productDTO = productDAO.getProductDetail(productDTO);
		assertNotNull(productDTO);
	}
	
	@Test
	public void setProductAddTest() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setName("삽");
		productDTO.setContents("잘파지는 삽");
		int result = productDAO.setProductAdd(productDTO);
		assertNotEquals(0, result);
	}
	
	@Test
	public void setProductUpdate() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(2L);
		productDTO.setName("대형 탠트");
		productDTO.setContents("어디서든 펼칠수 있는 튼튼한 탠트");
		int result = productDAO.setProductUpdate(productDTO);
		assertNotEquals(0, result);
	}
	
	@Test
	public void setProductDelete() throws Exception {
		ProductDTO productDTO = new ProductDTO();
		productDTO.setProductNum(1L);
		int result = productDAO.setProductDelete(productDTO);
		assertNotEquals(0, result);
	}
	
}
