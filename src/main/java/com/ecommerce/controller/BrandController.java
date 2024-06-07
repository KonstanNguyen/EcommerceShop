package com.ecommerce.controller;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.bean.Company;
import com.ecommerce.dto.response.CategoryNewProduct;
import com.ecommerce.dto.response.CategoryTopSelling;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrderService;
import com.ecommerce.service.UserService;

@Controller
@RequestMapping("brands")
public class BrandController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	Company company;

	@Autowired
	BrandService service;

	@Autowired
	CategoryService categoryService;
	@Autowired
	UserService UserSevice;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;

	@RequestMapping
	public String index(ModelMap model) {
		List<Brand> brands = service.fetchAll();
		model.addAttribute("brands", brands);
		List<CategoryNewProduct> categoriesNewProduct = categoryService.getCategoryNewProduct();
		model.addAttribute("categoriesNewProduct", categoriesNewProduct);

		return "home/pages/home";
	}

	@RequestMapping("all")
	public String allProducts(ModelMap model) {
		List<Category> categories = categoryService.fetchAllProduct();
		model.addAttribute("categories", categories);

		return "home/pages/all";
	}

	@RequestMapping(value = { "", "all" }, method = RequestMethod.POST)
	public String addToCartinAll(@RequestParam("categoryid") int categoryid, HttpSession session) {

		String referer = request.getHeader("referer");
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return "pages/login";
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		System.out.println(cart.getId());
		Orders order = new Orders();
		order.setCarts(cart);
		order.setCategories(categoryService.findByID(categoryid));
		List<Orders> orders = cart.getOrders().stream().distinct().collect(Collectors.toList());
		for (Orders o : orders)
			if (o.getCategories().getId() == categoryid) {
				o.setQuantity(o.getQuantity() + 1);
				orderService.updateOrder(o);
				if (referer != null) {
					return "redirect:" + referer;
				}
			}
		order.setQuantity(1);
		orderService.saveOrder(order);
		return "redirect:" + referer;
	}

	@ModelAttribute("cateTopSellings")
	public List<CategoryTopSelling> getTopSelling() {
		return categoryService.getTopSelling();
	}

	@ModelAttribute("countDownDate")
	public String getCountDownDate() {
		LocalDateTime countDownDate = LocalDateTime.of(2020, Month.JANUARY, 5, 15, 37, 25, 0);
		return countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString();
	}

	@ModelAttribute("company")
	public Company getCompany() {
		return company;
	}

	@ModelAttribute("orders")
	public List<Orders> getOrder(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return null;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		return cart.getOrders().stream().distinct().collect(Collectors.toList());
	}

	@ModelAttribute("totalItem")
	public int getTotalItem(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return 0;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		return cart.getOrders().stream().distinct().collect(Collectors.toList()).size();
	}

	@ModelAttribute("total")
	public BigInteger getTotal(HttpSession session) {
		BigInteger total = BigInteger.ZERO;
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (user == null) {
			return null;
		}
		Cart cart = cartService.findCartByUserId(user.getId());

		List<Orders> orders = cart.getOrders().stream().distinct().collect(Collectors.toList());
		for (Orders order : orders) {
			if (order.getCategories().getPromotionPrice() != null) {
				total = total.add(
						order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + "")));
			} else {
				total = total.add(order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + "")));
			}
		}
		return total;
	}

	/*
	 * @RequestMapping(method = RequestMethod.POST) public String
	 * deleteOrder(@RequestParam("id") int orderId, HttpSession session) { EcoUser
	 * user = (EcoUser) session.getAttribute("user"); if
	 * (session.getAttribute("user") == null) { return "Error here "; } Orders order
	 * = orderService.findByID(orderId); orderService.deleteOrder(order); return
	 * "redirect:/product.htm"; }
	 */
}
