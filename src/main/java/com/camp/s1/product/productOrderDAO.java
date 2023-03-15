package com.camp.s1.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class productOrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.camp.s1.product.ProductOrderDAO.";
	
	// Add 예약정보 생성
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductOrderAdd", productOrderDTO);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
