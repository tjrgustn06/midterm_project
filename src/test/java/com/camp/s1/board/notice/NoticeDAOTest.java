package com.camp.s1.board.notice;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.MyTest;
import com.camp.s1.board.BbsDTO;

public class NoticeDAOTest extends MyTest {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	public void getBoardListTest() throws Exception{
//		List<BbsDTO> list = noticeDAO.getBoardList();
		
//		assertNotEquals(0, list.size());
	}

}
