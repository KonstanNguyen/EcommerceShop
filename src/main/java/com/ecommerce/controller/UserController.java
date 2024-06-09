package com.ecommerce.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.random.RandomGenerator;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.CartService;
import com.ecommerce.service.OrderService;

import com.ecommerce.dto.request.RegisterUser;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Invoice;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.InvoiceService;
import com.ecommerce.service.MailerService;
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

	@Autowired
	InvoiceService invoiceService;

	@Autowired
	SessionFactory factory;
	
	@Autowired
	MailerService mailer;

	@RequestMapping("login")
	public String login(HttpSession session) {

		Object user = session.getAttribute("user");
		if (user != null && ((String) user).equals("admin")) {
			return "redirect:/admin.htm";
		}

		if (user != null) {
			return "redirect:/brands.htm";
		}

		return "pages/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request, HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		EcoUser user = new EcoUser(username, password);
		if (username != null && username.equals("admin") && password.equals("admin")) {
			session.setAttribute("user", user);
			return "redirect:/admin.htm";
		}

		user = userSevice.findByUsernameAndPassword(username,password);
		if (user == null) {
			request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
			return "pages/login";
		}

		session.setAttribute("user", user);
		String uri = (String) session.getAttribute("uriQuery");
		if (uri == null) {
			return "redirect:/brands.htm";
		}
		session.removeAttribute("uriQuery");

		return "redirect:/" + uri;
	}

	@RequestMapping("/register")
	public String showRegistrationForm() {
		return "pages/registration";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String submit(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		System.out.println(username);
		
		EcoUser user = userSevice.findByUsername(username);
		if (user != null || username.equals("admin")) {
			request.setAttribute("message", "Tài khoản đã tồn tại!");
			System.out.println(user.getName());
			return "pages/registration";			
		}
		
		if (!password.equals(confirmPassword)) {
			request.setAttribute("message", "Mật khẩu không trùng nhau!");
			return "pages/registration";
		}
		EcoUser newUser = new EcoUser(name, email, username, password);
		if(userSevice.save(newUser)) {
			request.setAttribute("message", "Đăng ký thành công");			
		} else {
			request.setAttribute("message", "Đăng ký thất bại");
		}
		return "pages/registration";
	}

	@RequestMapping(value = "logout")
	public String  logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("user") != null) {
			session.removeAttribute("user");
			session.removeAttribute("username");
		}
		return "redirect:/brands.htm";
	}
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(HttpServletRequest request) {
		request.setAttribute("user", request.getSession().getAttribute("user"));
		return "home/pages/profile";
	}
}
