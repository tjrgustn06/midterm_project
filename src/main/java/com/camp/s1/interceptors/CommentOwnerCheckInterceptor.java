package com.camp.s1.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.CommentDTO;
import com.camp.s1.board.notice.NoticeDAO;
import com.camp.s1.board.qna.QnaCommentDAO;
import com.camp.s1.board.qna.QnaDAO;
import com.camp.s1.board.story.StoryCommentDAO;
import com.camp.s1.camping.review.CampReviewDAO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.product.review.ProductReviewDAO;

public class CommentOwnerCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private QnaCommentDAO qnaCommentDAO;
	@Autowired
	private StoryCommentDAO storyCommentDAO;

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Long commentNum = Long.parseLong(request.getParameter("commentNum"));
		
		String uri = request.getRequestURI();
		uri = uri.substring(1,uri.lastIndexOf("/"));
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCommentNum(commentNum);
		if(uri.equals("qnaComment")) {
			commentDTO = (CommentDTO)qnaCommentDAO.getBoardDetail(commentDTO);
		} else {
			commentDTO = (CommentDTO)storyCommentDAO.getBoardDetail(commentDTO);
		}
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(!memberDTO.getId().equals(commentDTO.getWriter())) {
			request.setAttribute("result", "작성자만 가능");
			request.setAttribute("url", "./list");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/view/common/result.jsp");
			view.forward(request, response);
			
			return false;
		}
		
		
		
		return true;
	}

}
