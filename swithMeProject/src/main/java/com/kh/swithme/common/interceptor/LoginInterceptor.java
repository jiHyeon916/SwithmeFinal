package com.kh.swithme.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	/*
	 * extends HandlerIntercaptorAdapter
	 * 
	 * Interceptor(정확히 HandlerInterceptor)
	 * 
	 * Controller가 실행되기 전, 실행된 후에 낚아채서 실행할 내용을 작성 가능
	 * 로그인 유/무 판단, 회원의 권한체크 등을 인터셉터를 이용해서 진행할 수 있다
	 * 
	 * * 전처리 : preHandle 오버라이딩
	 * * 후처리 : postHandle 오버라이딩
	 * 
	 * preHandle(전처리) : 핸들러 호출 전 낚아챔
	 * postHandle(후처리) : 요청 처리 후 DispatcherServlet이 View 정보를 받기 전 낚아챔
	 * 
	 */
	
	// 
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		// 반환형 boolean
		// true 리턴 시 => 기존 요청 호출대로 Controller를 정상 실행함
		// false 리턴 시 => Controller를 실행X
		
		// 현재 요청을 보낸 사람이 로그인이 되어있을 경우 => Controller를 실행(호출)
		
		// 로그인 판단
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") != null) { // 로그인 유저가 비어있지 않을 경우에만 컨트롤러 호출
			return true;
		} else {
			session.setAttribute("alertMsg", "로그인 부탁드립니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
	}
	
	
	
	
	
	
	
	
	
}
