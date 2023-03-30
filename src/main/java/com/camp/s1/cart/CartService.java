package com.camp.s1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService {
	
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartDTO> getCartList() throws Exception {
		List<CartDTO> ar= cartDAO.getCartList();
		for(CartDTO cartDTO:ar) {
			cartDTO.setStartDate(cartDTO.getStartDate().substring(0, 10));
			cartDTO.setLastDate(cartDTO.getLastDate().substring(0, 10));
			System.out.println("lastDate : "+cartDTO.getLastDate());
		}
		return ar;
	}
	
	public int setCartAdd(CartDTO cartDTO) throws Exception {
		return cartDAO.setCartAdd(cartDTO);
	}
	
	public int setCartDelete(CartDTO cartDTO) throws Exception {
		return cartDAO.setCartDelete(cartDTO);
	}

}
