package com.camp.s1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.BbsService;
import com.camp.s1.board.CommentService;
import com.camp.s1.util.Pager;

@Service
public class QnaCommentService implements CommentService {
	
	@Autowired
	private QnaCommentDAO qnaCommentDAO;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {

		pager.makeNum(qnaCommentDAO.getTotalCount(pager));
		
		pager.makeRow();

		return qnaCommentDAO.getBoardList(pager);
	}

	

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		return qnaCommentDAO.setBoardAdd(bbsDTO);
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
	
	

}
