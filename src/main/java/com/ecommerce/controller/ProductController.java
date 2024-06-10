package com.ecommerce.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.Date;
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
			HttpSession session, ModelMap model) {
		String referer = request.getHeader("referer");
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return "redirect:/user/login.htm";
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		model.addAttribute("category", categoryService.findByID(categoryId));
		Orders order = new Orders();
		List<Orders> orders = cart.getOrders().stream().distinct().collect(Collectors.toList());
		order.setCarts(cart);
		order.setQuantity(quantity);
		for (Orders o : orders)
			if (o.getCategories().getId() == categoryId) {
				o.setQuantity(o.getQuantity() + quantity);
				orderService.updateOrder(o);
				return "redirect:/product?id=" + categoryId;
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
		// Lấy user từ session
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return null;
		}

		// Tìm cart theo userId
		Cart cart = cartService.findCartByUserId(user.getId());
		if (cart == null) {
			// Nếu không có cart hiện tại, tạo một cart mới
			Cart newCart = new Cart();
			newCart.setUser(user);
			newCart.setStatus(false); // Giỏ hàng còn hoạt động
			newCart.setCreateTime(java.sql.Date.valueOf(java.time.LocalDate.now()));
			cartService.saveCart(newCart);

			// Trả về đơn hàng của giỏ hàng mới
			List<Orders> orders = orderService.getOrdersByCartId(newCart.getId());
			return orders;
		}

		// In ra thông tin cart hiện tại
		System.out.println("cart id: " + cart.getUser().getUsername());

		// Nếu cart hiện tại đã hoàn thành (status = true), tạo một cart mới
		if (cart.isStatus() == true) {
			Cart newCart = new Cart();
			newCart.setUser(user);
			newCart.setStatus(false); // Giỏ hàng còn hoạt động
			newCart.setCreateTime(java.sql.Date.valueOf(java.time.LocalDate.now()));
			cartService.saveCart(newCart);

			// Trả về đơn hàng của giỏ hàng mới
			List<Orders> orders = orderService.getOrdersByCartId(newCart.getId());
			return orders;
		}

		// Trả về đơn hàng của giỏ hàng hiện tại (status = false)
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());
		return orders;
	}

	@ModelAttribute("totalItem")
	public int getTotalItem(HttpSession session) {
		// THêm vào giỏ hàng
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return 0;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());
		return orders.size();
	}

	@ModelAttribute("total")
	public BigDecimal getTotal(HttpSession session) {
		BigDecimal total = BigDecimal.ZERO;
		EcoUser user = (EcoUser) session.getAttribute("user");
		if (session.getAttribute("user") == null) {
			return null;
		}
		Cart cart = cartService.findCartByUserId(user.getId());
		List<Orders> orders = orderService.getOrdersByCartId(cart.getId());
		
		for (Orders order : orders) {
			Short totaldealPercent= 0;
			if (order.getCategories().getPromotion() != null) {
				Date now = new Date();
				totaldealPercent = order.getCategories().getPromotion().stream().distinct()
					.filter(p -> p.getStartTime().before(now) && p.getEndTime().after(now))
						.map(p -> p.getDealPercent())
						.reduce((short) 0, (a, b) -> (short) (a + b));
			}
			
			BigDecimal percent = new BigDecimal(100-totaldealPercent).divide(new BigDecimal(100));
			if (order.getCategories().getPromotionPrice() != null) {
				System.out.println(percent);
				total = total.add(
						new BigDecimal(order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + ""))).multiply(percent));
			} else {
				total = total.add(new BigDecimal(order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + ""))).multiply(percent));
			}
		}
		return total;
	}

	@ModelAttribute("company")
	public Company getCompany() {
		return company;
	}
}
