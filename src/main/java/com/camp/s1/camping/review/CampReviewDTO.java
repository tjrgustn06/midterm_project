package com.camp.s1.camping.review;

import java.util.List;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardFileDTO;

public class CampReviewDTO extends BbsDTO {
	
	private Long campNum;
	private Long mark;
	
	private List<BoardFileDTO> boardFileDTOs;
	
	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}
	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}
	public Long getCampNum() {
		return campNum;
	}
	public void setCampNum(Long campNum) {
		this.campNum = campNum;
	}
	public Long getMark() {
		return mark;
	}
	public void setMark(Long mark) {
		this.mark = mark;
	}
	

}
