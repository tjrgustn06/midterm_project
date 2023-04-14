package com.camp.s1.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.camp.s1.board.BbsDTO;
import com.camp.s1.board.notice.NoticeDAO;
import com.camp.s1.board.qna.QnaDAO;
import com.camp.s1.board.story.StoryDAO;
import com.camp.s1.camping.review.CampReviewDAO;
import com.camp.s1.member.MemberDTO;
import com.camp.s1.product.review.ProductReviewDAO;

public class OwnerCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private StoryDAO storyDAO;
	@Autowired
	private CampReviewDAO campReviewDAO;
	@Autowired
	private ProductReviewDAO productReviewDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Long num = Long.parseLong(request.getParameter("num"));
		
		String uri = request.getRequestURI();
		uri = uri.substring(1,uri.lastIndexOf("/"));
		BbsDTO bbsDTO = new BbsDTO();
		bbsDTO.setNum(num);
		if(uri.equals("notice")) {
			bbsDTO = noticeDAO.getBoardDetail(bbsDTO);
		} else if(uri.equals("qna")) {
			bbsDTO = qnaDAO.getBoardDetail(bbsDTO);
		} else if(uri.equals("story")) {
			bbsDTO = storyDAO.getBoardDetail(bbsDTO);
		}  else if(uri.equals("camp/review")) {
			bbsDTO = campReviewDAO.getBoardDetail(bbsDTO);
		} else {
			bbsDTO = productReviewDAO.getBoardDetail(bbsDTO);
		}
		
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		if(!memberDTO.getId().equals(bbsDTO.getWriter())) {
			request.setAttribute("result", "작성자만 가능");
			request.setAttribute("url", "./list");
			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/view/common/result.jsp");
			view.forward(request, response);
			
			return false;
		}
		
		
		
		return true;
	}

}
