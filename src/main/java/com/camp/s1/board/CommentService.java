package com.camp.s1.board;



public interface CommentService extends BbsService {
	
	//insert(add) comment
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
	
	//delete
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception;
}
