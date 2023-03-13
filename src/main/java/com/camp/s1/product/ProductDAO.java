package com.camp.s1.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.camp.s1.product.ProductDAO.";
	
	// List 출력
	public List<ProductDTO> getProductList() throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getProductList");
	}
	
}
