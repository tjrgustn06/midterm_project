package com.camp.s1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BoardDAO;
import com.camp.s1.board.BoardDTO;
import com.camp.s1.board.BoardFileDTO;
import com.camp.s1.board.BoardService;
import com.camp.s1.util.Pager;

@Repository
public class QnaDAO implements BoardDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	private final String NAMESPACE = "com.camp.s1.board.qna.QnaDAO.";

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBoardList", pager);
	}

	@Override
	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardAdd", bbsDTO);
	}

	@Override
	public int setBoardUpdate(BbsDTO bbsDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setBoardUpdate", bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setBoardDelete", bbsDTO);
	}

	@Override
	public BoardDTO getBoardDetail(BoardDTO boardDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBoardDetail", boardDTO);
	}

	@Override
	public int setBoardFileAdd(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setBoardFileAdd", boardFileDTO);
	}

	@Override
	public List<BoardFileDTO> getBoardFileList(BbsDTO bbsDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBoardFileList", bbsDTO);
	}

	@Override
	public BoardFileDTO getBoardFileDetail(BoardFileDTO boardFileDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBoardFileDetail", boardFileDTO);
	}

	@Override
	public int setBoardFileDelete(Long fileNum) throws Exception {
		return sqlSession.delete(NAMESPACE + "setBoardFileDelete", fileNum);
	}

	@Override
	public int setBoardHitCount(BoardDTO boardDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setBoardHitCount", boardDTO);
	}

	

	
}
