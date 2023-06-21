package com.kh.swithme.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginMember") != null) { // 로그인 유저가 비어있지 않을 경우에만 컨트롤러 호출
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 부탁드립니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}
	
	
	
	
	
	
	
	
	
}
