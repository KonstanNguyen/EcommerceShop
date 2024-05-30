package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userSevice;
	
	@RequestMapping("login")
	public String login() {
		return "pages/login";
	}
	
	@RequestMapping(value = "login",method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request) {
		String direct = "brands.htm";
		try {
			EcoUser user = userSevice.findByUsername(request.getParameter("username"));
			if (user == null) {
				direct = "user/login.htm";
			}
		} catch (Exception e) {
			direct = "";
			e.printStackTrace();
		}
		return "redirect:/"+direct;
	}
}
