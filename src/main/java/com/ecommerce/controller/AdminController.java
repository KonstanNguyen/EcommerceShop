/*
 * package com.ecommerce.controller;
 * 
 * import java.util.List;
 * 
 * import javax.servlet.http.Cookie; import
 * javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.ModelMap; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * import com.ecommerce.entity.Category; import com.ecommerce.entity.EcoUser;
 * import com.ecommerce.service.CategoryService; import
 * com.ecommerce.service.UserService;
 * 
 * @Controller
 * 
 * @RequestMapping("admin") public class AdminController {
 * 
 * @Autowired UserService userSevice;
 * 
 * @Autowired CategoryService categoryService;
 * 
 * @RequestMapping("login") public String login(HttpSession session) { if
 * (session.getAttribute("user") != null) { return "redirect:/brands.htm"; }
 * 
 * return "pages/login"; }
 * 
 * @RequestMapping(value = "login", method = RequestMethod.POST) public String
 * checkLogin(HttpServletRequest request, HttpServletResponse response) {
 * 
 * String username = request.getParameter("username"); // String password =
 * request.getParameter("password");
 * 
 * EcoUser user = userSevice.findByUsername(username);
 * 
 * if (user == null) { return "redirect:/user/login.htm"; }
 * 
 * Cookie cookie = new Cookie("uid", user.getUsername().strip());
 * cookie.setPath("/EcommerceShop"); cookie.setMaxAge(60 * 60 * 24);
 * response.addCookie(cookie);
 * 
 * HttpSession session = request.getSession(); session.setAttribute("user",
 * user);
 * 
 * return "redirect:/brands.htm"; }
 * 
 * @RequestMapping(value = "logout") public String logout(HttpServletRequest
 * request, HttpServletResponse response) { Cookie cookie = new Cookie("uid",
 * null); cookie.setMaxAge(0); response.addCookie(cookie);
 * 
 * HttpSession session = request.getSession(); session.removeAttribute("user");
 * 
 * return "redirect:/brands.htm"; }
 * 
 * @RequestMapping("all") public String allProducts(ModelMap model) {
 * List<Category> categories = categoryService.fetchAllProduct();
 * model.addAttribute("categories", categories);
 * 
 * return "home/pages/all"; } }
 */