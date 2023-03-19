package com.camp.s1.product.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.util.Pager;

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
	
	// 주문번호 입력
	public int setOrderNum(ProductOrderDTO productOrderDTO) throws Exception {
		System.out.println(productOrderDTO.getOrderNum());
		return sqlSession.insert(NAMESPACE+"setOrderNum", productOrderDTO);
	}
	
	// Order List 출력
	public List<ProductOrderDTO> getProductOrderList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getProductOrderList", pager);
	}
	
	// Detail 주문 페이지
	public ProductOrderDTO getProductOrderDetail(ProductOrderDTO productOrderDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getProductOrderDetail", productOrderDTO);
	}
	
	// Payment 주문 결제
	public int setProductOrderPayment(ProductOrderDTO productOrderDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setProductOrderPayment", productOrderDTO);
	}
	
	// 총 갯수 출력
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getTotalCount", pager);
	}
	
}
