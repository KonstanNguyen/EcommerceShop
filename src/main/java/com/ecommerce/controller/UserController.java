package com.ecommerce.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.dto.request.RegisterUser;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.MailerService;
import com.ecommerce.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	UserService userSevice;
	
	@Autowired
	MailerService mailer;

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
    public String showRegistrationForm(Model model){
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
	
	@RequestMapping("form")
	public String form() {
		return "mailer/form";
	}
	
	@RequestMapping(value = "send")
	public String send(ModelMap model,
			@RequestParam("from") String from,
			@RequestParam("to") String to,
			@RequestParam("subject") String subject,
			@RequestParam("body") String body) {
		try {
			mailer.send(from, to, subject, body);
			model.addAttribute("message", "Gửi email thành công!");
		} catch (Exception e) {
			model.addAttribute("message", "Gửi email thất bại!");
		}
		
		return "mailer/form";
	}
}
