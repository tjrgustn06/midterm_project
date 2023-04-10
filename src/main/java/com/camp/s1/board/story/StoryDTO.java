package com.camp.s1.board.story;

import java.util.List;

import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;

public class StoryDTO extends BoardDTO {
	private List<BoardFileDTO> boardFileDTOs;
	private Long boardId;
	
	public Long getBoardId() {
		return boardId;
	}

	public void setBoardId(Long boardId) {
		this.boardId = boardId;
	}

	public List<BoardFileDTO> getBoardFileDTOs() {
		return boardFileDTOs;
	}

	public void setBoardFileDTOs(List<BoardFileDTO> boardFileDTOs) {
		this.boardFileDTOs = boardFileDTOs;
	}


	
	
	
	
}
