package com.camp.s1.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;


public interface BbsService {

	//list
	//Pager 클래스 구현 후 매개변수로 추가해야함
	public List<BbsDTO> getBoardList() throws Exception; 
	
	//insert(add)
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile [] files, HttpSession session) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception;
	
	//delete
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception;
}
