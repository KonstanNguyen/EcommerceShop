package com.ecommerce.controller;

import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.CartService;
import com.ecommerce.service.OrderService;
import com.ecommerce.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userSevice;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;

	@RequestMapping("login")
	public String login(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/brands.htm";
		}

		return "pages/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		String username = request.getParameter("username");
//		String password = request.getParameter("password");

		EcoUser user = userSevice.findByUsername(username);

		if (user == null) {
			return "redirect:/user/login.htm";
		}

		Cookie cookie = new Cookie("uid", user.getUsername().strip());
		cookie.setPath("/EcommerceShop");
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);

		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		
		if(session.getAttribute("uriQuery") == null) {
			return "redirect:/brands.htm";
		}
		String uri = (String)session.getAttribute("uriQuery");
		session.removeAttribute("uriQuery");
		return "redirect:/" + uri;
	}
	
	/*
	 * @RequestMapping("register") public String register(ModelMap
	 * model, @Validated @ModelAttribute("userRegister") RegisterUser user,
	 * BindingResult errors) { return "pages/registration"; }
	 * 
	 * @RequestMapping(value = "register", method = RequestMethod.POST ) public
	 * String submit(ModelMap model, @Validated @ModelAttribute("userRegister")
	 * RegisterUser user, BindingResult resutl, Errors errors) { String returnVal =
	 * "redirect:/brands.htm"; if (resutl.hasErrors() || errors.hasErrors()) {
	 * model.addAttribute("message", "Vui lòng sửa các lỗi sau đây"); returnVal =
	 * "pages/registration"; } return returnVal; }
	 */

	@RequestMapping(value = "logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("uid", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		HttpSession session = request.getSession();
		session.removeAttribute("user");

		return "redirect:/brands.htm";
	}
	
}
