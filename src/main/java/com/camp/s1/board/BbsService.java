package com.camp.s1.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;


public interface BbsService {

	//list
	//Pager 
	public List<BbsDTO> getBoardList() throws Exception; 
	
	//insert(add)
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile [] files, HttpSession session) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
	
	//delete
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception;
}
