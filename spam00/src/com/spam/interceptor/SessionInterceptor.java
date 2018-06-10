package com.spam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle (HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession httpSession = request.getSession(true);
		Boolean isLogin = httpSession.getAttribute("isLogin") != null ? (Boolean) httpSession.getAttribute("isLogin") : false;
		
		if(!isLogin) {
			System.out.println("난 세션인터");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
