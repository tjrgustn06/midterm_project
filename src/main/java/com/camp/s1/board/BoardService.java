package com.camp.s1.board;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface BoardService extends BbsService {
	
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception;
	
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception;
	
	//update
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile [] multipartFiles, HttpSession session, Long [] fileNum) throws Exception;
	
	public int setBoardFileDelete(Long fileNum) throws Exception;
}
