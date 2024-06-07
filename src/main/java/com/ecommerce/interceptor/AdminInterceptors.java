package com.ecommerce.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.UserService;

public class AdminInterceptors extends HandlerInterceptorAdapter {
	@Autowired
	UserService userService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String uid = getCookie(request, "uid");
		
		if (uid == null || uid.equals("")) {
			response.sendRedirect(request.getContextPath()+"/user/login.htm");
			return false;
		}
		
		EcoUser user = userService.findByUsername(uid);
		if (user == null) {
			response.sendRedirect(request.getContextPath()+"/user/login.htm");
			return false;
		}
		
		if (user.isAdmin()) {
			response.sendRedirect(request.getContextPath()+"/user/login.htm");
			return false;
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		return true;
	}
	
	private String getCookie(HttpServletRequest req, String name) {
        for (Cookie cookie : req.getCookies()) {
            if (cookie.getName().equals(name))
                return cookie.getValue();
        }
        return null;
    }
}
