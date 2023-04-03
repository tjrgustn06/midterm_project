package com.camp.s1.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.camp.s1.product.ProductGradeDTO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.camp.s1.cart.CartDAO.";
	
	public List<CartDTO> getCartList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCartList");
	}
	
	public CartDTO getCartDetail(CartDTO cartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getCartDetail", cartDTO);
	}
	
	public int setCartUpdate(CartDTO cartDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setCartUpdate", cartDTO);
	}
	
	public int setCartAdd(CartDTO cartDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setCartAdd", cartDTO);
	}
	
	public int setCartDelete(CartDTO cartDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setCartDelete", cartDTO);
	}
	
	public ProductGradeDTO getGradeStock(ProductGradeDTO productGradeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getGradeStock", productGradeDTO);
	}
	
	public int setGradeStockUpdate(ProductGradeDTO productGradeDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setGradeStockUpdate", productGradeDTO);
	}

}
