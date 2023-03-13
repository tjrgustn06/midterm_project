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
	
	// Detail 상세페이지 출력
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getProductDetail", productDTO);
	}
	
	// Add 물품 추가
	public int setProductAdd(ProductDTO productDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setProductAdd", productDTO);
	}
	
	// Update 물품 수정
	public int setProductUpdate(ProductDTO productDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setProductUpdate", productDTO);
	}
	
}
