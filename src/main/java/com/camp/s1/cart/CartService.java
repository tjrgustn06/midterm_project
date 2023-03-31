package com.camp.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.product.ProductGradeDTO;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList() throws Exception {
		List<CartDTO> ar= cartDAO.getCartList();
		for(CartDTO cartDTO:ar) {
			cartDTO.setStartDate(cartDTO.getStartDate().substring(0, 10));
			cartDTO.setLastDate(cartDTO.getLastDate().substring(0, 10));
		}
		return ar;
	}
	
	public int setCartAdd(CartDTO cartDTO) throws Exception {
		return cartDAO.setCartAdd(cartDTO);
	}
	
	public int setCartDelete(CartDTO cartDTO) throws Exception {
		return cartDAO.setCartDelete(cartDTO);
	}
	
	public int setStockUpdate(List<CartDTO> cartDTOs) throws Exception {
		int result = 0;
		for(CartDTO cartDTO:cartDTOs) {
			ProductGradeDTO productGradeDTO = new ProductGradeDTO();
			productGradeDTO.setGradeNum(cartDTO.getGradeNum());
			productGradeDTO=cartDAO.getGradeStock(productGradeDTO);
			productGradeDTO.setGradeStock(productGradeDTO.getGradeStock()-cartDTO.getAmount());
			result = cartDAO.setGradeStockUpdate(productGradeDTO);
			result = cartDAO.setCartDelete(cartDTO);
		}
		
		return result;
	}

}
