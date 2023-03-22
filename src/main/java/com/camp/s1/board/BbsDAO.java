package com.camp.s1.board;

import java.util.List;

import com.camp.s1.util.Pager;


public interface BbsDAO {
	
	
	//totalCount
	//Pager 클래스 구현후 매개변수로 추가해야함
	public Long getTotalCount(Pager pager) throws Exception;
	
	//detail
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception;
	
	
	//list
	//Pager 클래스 구현후 매개변수로 추가해야함
	public List<BbsDTO> getBoardList(Pager pager) throws Exception;
	
	//insert(add)
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
	
	//delete
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception;
	
}
