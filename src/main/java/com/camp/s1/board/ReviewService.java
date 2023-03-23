package com.camp.s1.board;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService extends BbsService {
	
	//insert(add) board
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile [] files, HttpSession session) throws Exception;
	
	public BbsDTO getBoardDetail(BbsDTO bbsDTO) throws Exception;
	
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile [] multipartFiles, HttpSession session) throws Exception;
	
	public int setBoardFileDelete(Long fileNum) throws Exception;
	
}
