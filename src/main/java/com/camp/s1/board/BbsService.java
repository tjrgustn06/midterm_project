package com.camp.s1.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.util.Pager;


public interface BbsService {

	//list
	//Pager 클래스 구현후 매개변수로 추가해야함
	public List<BbsDTO> getBoardList(Pager pager) throws Exception; 
	

	

}
