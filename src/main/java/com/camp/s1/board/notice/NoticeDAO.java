package com.camp.s1.board.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDAO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;

public class NoticeDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.camp.s1.board.notice.NoticeDAO.";

	@Override
	public Long getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BbsDTO> getBoardList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBoardList");
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BoardFileDTO> getBoardFileList(BbsDTO bbsDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
