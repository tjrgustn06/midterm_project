package com.camp.s1.product.review;

import com.camp.s1.board.BoardDTO;

public class ReviewDTO extends BoardDTO{
	private Long productNum;

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	

}
