package com.camp.s1.board.qna;

import java.util.List;

import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;

public class QnaDTO extends BoardDTO{
	
	private List<BoardFileDTO> boardFileDTOs;

	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}

}
