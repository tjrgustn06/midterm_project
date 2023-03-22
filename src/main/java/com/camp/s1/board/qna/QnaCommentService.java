package com.camp.s1.board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.CommentDTO;
import com.camp.s1.board.CommentService;
import com.camp.s1.util.Pager;

@Service
public class QnaCommentService implements CommentService {
	
	@Autowired
	private QnaCommentDAO qnaCommentDAO;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {

		pager.setPerPage(5L);
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
		return qnaCommentDAO.setBoardUpdate(bbsDTO);
	}

	@Override
	public int setBoardDelete(BbsDTO bbsDTO) throws Exception {
		return qnaCommentDAO.setBoardDelete(bbsDTO);
	}



	@Override
	public int setSubCommentAdd(CommentDTO commentDTO) throws Exception {
		QnaCommentDTO parent =(QnaCommentDTO)qnaCommentDAO.getBoardDetail(commentDTO);
		
		System.out.println(parent.getRef());
		
		commentDTO.setNum(parent.getNum());
		
		commentDTO.setRef(parent.getRef());
		
		commentDTO.setStep(parent.getStep()+1);
		
		commentDTO.setDepth(parent.getDepth()+1);
		
		int result = qnaCommentDAO.setStepUpdate(parent);
		
		result = qnaCommentDAO.setSubCommentAdd(commentDTO);
		
		return result;
	}
	
	
	
	

}
