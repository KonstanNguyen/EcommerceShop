package com.ecommerce.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrderService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired
	OrderService orderService;
	@Autowired
	CartService cartService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping
	public String index() {
		return "home/pages/cart";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String deleteOrder(@RequestParam("orderID") int orderID) {
		System.out.println(orderID);
		Orders order = orderService.findByID(orderID);
		orderService.deleteOrder(order);
		return "redirect:/cart.htm";
	}
	@ModelAttribute("orders")
	public List<Orders> getOrder(HttpSession session) {
		// Thêm vào giỏ hàng
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
}
