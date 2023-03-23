package com.camp.s1.board.story;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;
import com.camp.s1.board.BoardService;
import com.camp.s1.util.FileManager;
import com.camp.s1.util.Pager;

@Service
public class StoryService implements BoardService {

	@Autowired
	private StoryDAO storyDAO;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		Long totalCount = storyDAO.getTotalCount(pager);
		
		pager.makeNum(totalCount);
		
		pager.makeRow();
		
		return storyDAO.getBoardList(pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO, MultipartFile[] files, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getBoardDetail(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO, MultipartFile[] multipartFiles, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardHitCount(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
