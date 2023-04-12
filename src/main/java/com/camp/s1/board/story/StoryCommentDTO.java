package com.camp.s1.board.story;

import com.camp.s1.board.CommentDTO;

public class StoryCommentDTO extends CommentDTO{
	private Long boardId;
	
	public Long getBoardId() {
		return boardId;
	}

	public void setBoardId(Long boardId) {
		this.boardId = boardId;
	}
}
