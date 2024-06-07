package com.ecommerce.controller;

import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecommerce.bean.Company;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrderService;

@Controller
@RequestMapping("product")
public class ProductController {
	 @Autowired
	 private HttpServletRequest request;
	@Autowired
	CategoryService categoryService;
	@Autowired
	CartService cartService;
	@Autowired
	OrderService orderService;
	@Autowired
	Company company;

	@RequestMapping
	public String index(@RequestParam("id") int ID, ModelMap model) {
		Category category = categoryService.findByID(ID);
		model.addAttribute("category", category);
		return "home/pages/product";
	}

	
	@RequestMapping(method = RequestMethod.POST)
	public String addToCart(@RequestParam("quantity") int quantity, @RequestParam("categoryId") int categoryId,
			HttpSession session,ModelMap model) {
		String referer = request.getHeader("referer");
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "Error here ";
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		System.out.println(cart.getId());
		model.addAttribute("category", categoryService.findByID(categoryId));
		Orders order = new Orders();
		order.setInvoiceId(null);
		List<Orders> orders = cart.getOrders().stream().distinct().collect(Collectors.toList());
		order.setCarts(cart);
		order.setQuantity(quantity);
		for (Orders o : orders)
			if (o.getCategories().getId() == categoryId) {
				o.setQuantity(o.getQuantity() + quantity);
				orderService.updateOrder(o);
				return "home/pages/product";
//				if (referer != null) {
//		            return "redirect:" + referer;
//		        }
			}
		order.setCategories(categoryService.findByID(categoryId));
		orderService.saveOrder(order);
		/*
		 * if (referer != null) { return "redirect:" + referer; }
		 */
		return "home/pages/product";
	}
	@ModelAttribute("orders")
	public List<Orders> getOrder(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return null;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		return cart.getOrders().stream().distinct().collect(Collectors.toList());
	}
	@ModelAttribute("totalItem")
	public int getTotalItem(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return 0;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		return cart.getOrders().stream().distinct().collect(Collectors.toList()).size();
	}
	@ModelAttribute("total")
	public BigInteger getTotal(HttpSession session) {
		BigInteger total = BigInteger.ZERO;
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
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
	@ModelAttribute("company")
	public Company getCompany() {
		return company;
	}
}
