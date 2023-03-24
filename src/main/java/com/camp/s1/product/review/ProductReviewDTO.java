package com.camp.s1.product.review;

import java.util.List;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardFileDTO;

public class ProductReviewDTO extends BbsDTO {
	
	private Long productNum;
	
	private List<BoardFileDTO> boardFileDTOs;

	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}

	public Long getProductNum() {
		return productNum;
	}

	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	} 

}
