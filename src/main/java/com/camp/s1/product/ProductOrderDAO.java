package com.camp.s1.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductOrderDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.camp.s1.product.ProductOrderDAO.";
	
	// Add 주문하기
	public int setProductOrderAdd(ProductOrderDTO productOrderDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setProductOrderAdd", productOrderDTO);
	}
	
	// 주문번호 생성
	public Long getOrderNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getOrderNum");
	}
	
	// GradeNum 출력
	public Long getGradeNum(ProductGradeDTO productGradeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getGradeNum", productGradeDTO);
	}
	
}
