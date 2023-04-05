package com.camp.s1.board.story;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.CommentDTO;
import com.camp.s1.board.CommentService;
import com.camp.s1.util.Pager;

@Service
public class StoryCommentService implements CommentService{
	
	@Autowired
	private StoryCommentDAO storyCommentDAO;

	@Override
	public List<BbsDTO> getBoardList(Pager pager) throws Exception {
		Long totalCount = storyCommentDAO.getTotalCount(pager);
		
		pager.makeNum(totalCount);
	

		pager.makeRow();
		
		return storyCommentDAO.getBoardList(pager);
	}

	@Override
	public int setBoardAdd(BbsDTO bbsDTO) throws Exception {
		return storyCommentDAO.setBoardAdd(bbsDTO);
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
	public int setSubCommentAdd(CommentDTO commentDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
