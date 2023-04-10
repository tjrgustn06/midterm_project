package com.camp.s1.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.cart.CartDTO;
import com.camp.s1.util.Pager;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.camp.s1.product.ProductDAO.";
	
	// List 출력
	public List<ProductDTO> getProductList(Pager pager) throws Exception {
		
		return sqlSession.selectList(NAMESPACE+"getProductList", pager);
	}
	
	// CartBar 출력
	public List<CartDTO> getCartBarList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartBarList", pager);
	}
	
	// CartBarFile 출력
	public ProductFileDTO getCartBarFileDetail(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCartBarFileDetail", cartDTO);
	}
	
	// 총 갯수 출력
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
	// Detail 상세페이지 출력
	public ProductDTO getProductDetail(ProductDTO productDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"getProductDetail", productDTO);
	}
	
	// Add 물품 추가
	public int setProductAdd(ProductDTO productDTO) throws Exception {
		
		return sqlSession.insert(NAMESPACE+"setProductAdd", productDTO);
	}
	
	// Grade 추가
	public int setProductGradeAdd(ProductGradeDTO productGradeDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductGradeAdd", productGradeDTO);
	}
	
	// productFile 추가
	public int setProductFileAdd(ProductFileDTO productFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setProductFileAdd", productFileDTO);
	}
	
	// Update 물품 수정
	public int setProductUpdate(ProductDTO productDTO) throws Exception {
		
		return sqlSession.update(NAMESPACE+"setProductUpdate", productDTO);
	}
	
	public int setProductGradeUpdate(ProductGradeDTO productGradeDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductGradeUpdate", productGradeDTO);
	}
	
	public int setproductFileDelete(Long fileNum) throws Exception {
		return sqlSession.delete(NAMESPACE+"setProductFileDelete", fileNum);
	}
	
	// Delete 물품 삭제
	public int setProductDelete(ProductDTO productDTO) throws Exception {
		
		return sqlSession.delete(NAMESPACE+"setProductDelete", productDTO);
	}
	
	public List<ProductFileDTO> getProductFileList(ProductDTO productDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductFileList", productDTO);
	}
	
}
