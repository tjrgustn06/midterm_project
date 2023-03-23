package com.camp.s1.product.review;

import com.camp.s1.board.BbsDTO;

public class ProductReviewDTO extends BbsDTO {
	
	private Long productNum;

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	} 

}
