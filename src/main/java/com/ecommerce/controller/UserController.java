package com.ecommerce.controller;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.CartService;
import com.ecommerce.service.OrderService;

import com.ecommerce.service.InvoiceService;
import com.ecommerce.service.MailerService;
import com.ecommerce.service.UserService;

import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;

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
		/*
		 * String pass=argon2.verify(user.getPassword(), password.toCharArray()); user =
		 * userSevice.findByUsernameAndPassword(username, ); if (user == null) {
		 * request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
		 * return "pages/login"; }
		 */
		user = userSevice.findByUsername(username);
		if (user == null) {
			request.setAttribute("message", "Tài khoản không chính xác!");
			return "pages/login";
		}
		Argon2 argon2 = Argon2Factory.create();
	    if (!argon2.verify(user.getPassword(), password)) {
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

		EcoUser user = userSevice.findByUsername(username);
		if (user != null || username.equals("admin")) {
			request.setAttribute("message", "Tài khoản đã tồn tại!");
			return "pages/registration";
		}

		if (!password.equals(confirmPassword)) {
			request.setAttribute("message", "Mật khẩu không trùng nhau!");
			return "pages/registration";
		}
		Argon2 argon2 = Argon2Factory.create();
		String hashPassword = argon2.hash(2, 65536, 1, password);
		System.out.println(hashPassword);
		EcoUser newUser = new EcoUser(name, email, username, hashPassword);
		if (userSevice.save(newUser)) {
			request.setAttribute("message", "Đăng ký thành công");
			Cart cart = new Cart();
			cart.setUser(newUser);
			cart.setStatus(false);
			cart.setCreateTime(java.sql.Date.valueOf(java.time.LocalDate.now()));
			cartService.saveCart(cart);
		} else {
			request.setAttribute("message", "Đăng ký thất bại");
		}
		return "pages/registration";
	}

	@RequestMapping(value = "logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
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

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String updateProfile(@ModelAttribute("user") EcoUser user, BindingResult result, ModelMap model) {

		if (user.getName() == null || user.getName().isEmpty()) {
			result.rejectValue("name", "user", "Vui lòng nhập tên!");
		}
		if (user.getEmail() == null || user.getEmail().isEmpty()) {
			result.rejectValue("email", "user", "Vui lòng nhập email!");
		}
		if (user.getPhone() == null || user.getPhone().isEmpty()) {
			result.rejectValue("phone", "user", "Vui lòng nhập số điện thoại!");
		}
		if (user.getAddress() == null || user.getAddress().isEmpty()) {
			result.rejectValue("address", "user", "Vui lòng nhập địa chỉ!");
		}
		if (user.getDateOfBirth() == null) {
			result.rejectValue("dateOfBirth", "user", "Vui lòng nhập ngày sinh!");
		}
		if (user.getCMND() == null || user.getCMND().isEmpty() || user.getCMND().isBlank()) {
			result.rejectValue("CMND", "user", "Vui lòng nhập CMND!");
		}
		if (result.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
			return "home/pages/profile";
		}
		userSevice.update(user);
		model.addAttribute("message", "Cập nhật thông tin thành công!");
		
		return "home/pages/profile";
	}
	
	@RequestMapping("/changePassword")
	public String changePassword() {
		return "pages/changepassword";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request) {
		String oldPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		EcoUser user = (EcoUser) request.getSession().getAttribute("user");
		Argon2 argon2 = Argon2Factory.create();
		if (!argon2.verify(user.getPassword(), oldPassword)) {
			request.setAttribute("message", "Mật khẩu cũ không chính xác!");
			return "home/pages/profile";
		}
		if (!newPassword.equals(confirmPassword)) {
			request.setAttribute("message", "Mật khẩu mới không trùng nhau!");
			return "home/pages/profile";
		}
		String hashPassword = argon2.hash(2, 65536, 1, newPassword);
		user.setPassword(hashPassword);
		if (userSevice.update(user)) {
			return "redirect:/user/profile.htm?message=success";
		} else {
			return "redirect:/user/profile.htm?message=failed";
		}
	}
}
