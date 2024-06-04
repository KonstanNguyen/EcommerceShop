package com.ecommerce.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.UserService;

public class AuthInterceptors extends HandlerInterceptorAdapter {
	
	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			HttpSession session2 = request.getSession();
			String[] arr = request.getRequestURI().split("/", 3);
			String uri = arr[arr.length-1];
			System.out.println(session2.getAttribute("uriQuery"));
			session2.setAttribute("uriQuery", uri + (request.getQueryString() != null? "?" + request.getQueryString():""));
			response.sendRedirect(request.getContextPath()+"/user/login.htm");
			return false;
		}

		return true;
	}
}