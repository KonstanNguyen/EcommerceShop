package com.ecommerce.controller;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.dto.request.RegisterUser;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Invoice;
import com.ecommerce.service.InvoiceService;
import com.ecommerce.service.UserService;

import jakarta.validation.Valid;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userSevice;

	@Autowired
	InvoiceService invoiceService;

	@Autowired
	SessionFactory factory;

	@RequestMapping("login")
	public String login(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return "redirect:/brands.htm";
		}

		return "pages/login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request, HttpServletResponse response) {

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

		if (session.getAttribute("uriQuery") == null) {
			return "redirect:/brands.htm";
		}

		String uri = (String) session.getAttribute("uriQuery");
		session.removeAttribute("uriQuery");

		return "redirect:/" + uri;
	}

	@RequestMapping("/register")
	public String showRegistrationForm(Model model) {
		// create model object to store form data
		RegisterUser user = new RegisterUser();
		model.addAttribute("userRegister", user);
		return "pages/registration";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String submit(@ModelAttribute("userRegister") RegisterUser user, BindingResult result) {
		if (user.getName() == null || user.getName().equals("")) {
			result.rejectValue("name", "userRegister", "Vui lòng nhập tên");
		}
		if (user.getEmail() == null || user.getEmail().equals("")) {
			result.rejectValue("email", "userRegister", "Vui lòng nhập email");
		}
		if (user.getUsername() == null || user.getUsername().equals("")) {
			result.rejectValue("username", "userRegister", "Vui lòng nhập tài khoản");
		}
		if (user.getPassword() == null || user.getUsername().equals("")) {
			result.rejectValue("password", "userRegister", "Vui lòng nhập mật khẩu");
		}
		if (user.getConfirmPassword() == null || user.getConfirmPassword().equals("")) {
			result.rejectValue("confirmPassword", "userRegister", "Vui lòng xác nhận mật khẩu");
		}

		if (result.getFieldErrorCount() == 0) {
			return "success";
		}

		return "pages/registration";
	}

	@RequestMapping(value = "logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie cookie = new Cookie("uid", null);
		cookie.setMaxAge(0);
		response.addCookie(cookie);

		HttpSession session = request.getSession();
		session.removeAttribute("user");

		return "redirect:/brands.htm";
	}

	@RequestMapping("checkout")
	public String index(ModelMap model) {
		Random randomNumbers = new Random();
		Invoice invoice = new Invoice(randomNumbers.nextInt(0, 9999), "123",
				Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()), "Thuy", "tt@gmail.com", "0123456789",
				"Nha cho dau");
		model.addAttribute("ecoInvoice", invoice);
		return "home/pages/checkout";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST )
	public String index(HttpServletRequest request, @ModelAttribute("ecoInvoice") Invoice invoice) {
		invoice.setId(11);
		invoice.setDate(Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
		if (invoiceService.insertInvoice(invoice) == true) {
			request.setAttribute("message", "Them thanh cong");
		} else {
			request.setAttribute("message", "Them that bai");
		}
		return "home/pages/checkout";
	}
}