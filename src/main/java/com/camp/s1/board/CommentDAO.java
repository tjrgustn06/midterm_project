package com.camp.s1.board;

public interface CommentDAO extends BbsDAO {
	public int setStepUpdate(BbsDTO bbsDTO) throws Exception;
	
	public int setSubCommentAdd(BbsDTO bbsDTO) throws Exception;
}
