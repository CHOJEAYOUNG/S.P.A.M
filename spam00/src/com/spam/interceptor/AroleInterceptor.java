package com.spam.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AroleInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (((String) request.getSession().getAttribute("power")) == "A") {
			System.out.println("난 roll인터A");
			response.sendRedirect(request.getContextPath() + "/main");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
