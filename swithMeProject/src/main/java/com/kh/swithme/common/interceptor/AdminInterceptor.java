package com.kh.swithme.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.swithme.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		if((session.getAttribute("loginMember") != null) && (((Member)session.getAttribute("loginMember")).getMemberId().equals("admin"))) {
			return true;
		} else {
			session.setAttribute("alertMsg", "관리자만 접근이 가능합니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
}
