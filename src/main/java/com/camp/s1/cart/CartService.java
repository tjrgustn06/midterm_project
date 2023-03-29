package com.camp.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList() throws Exception {
		return cartDAO.getCartList();
	}
	
	public int setCartAdd(CartDTO cartDTO) throws Exception {
		return cartDAO.setCartAdd(cartDTO);
	}

}
