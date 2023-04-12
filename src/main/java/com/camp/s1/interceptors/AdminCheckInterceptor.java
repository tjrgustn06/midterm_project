package com.camp.s1.interceptors;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.camp.s1.member.MemberDTO;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		MemberDTO memberDTO = (MemberDTO)request.getSession().getAttribute("member");
		
		if(memberDTO !=null) {
			if(memberDTO.getRoleName().equals("ADMIN")) {
				return true;
			}
		}
		request.setAttribute("result", "권한이 없습니다.");
		request.setAttribute("url", "../");
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
		view.forward(request, response);
		
		return false;
	}

}
