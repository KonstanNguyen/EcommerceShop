package com.ecommerce.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ecommerce.entity.Cart;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.OrderService;

@Controller

public class CartController {
	@Autowired
	OrderService orderService;
	@Autowired
	CartService cartService;
	@Autowired
	CategoryService categoryService;

	@RequestMapping("/cart")
	public String index() {
		return "home/pages/cart";
	}

	@RequestMapping("/delete")
	public String deleteProduct(@RequestParam("id") int orderId) {
		Orders order = new Orders();
		order.setId(orderId);
		orderService.deleteOrder(order);
		return "redirect:/cart.htm";
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
		List<Orders> orders=orderService.getOrdersByCartId(cart.getId());
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
				total = total.add(
						new BigDecimal(order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + ""))).multiply(percent));
			} else {
				total = total.add(new BigDecimal(order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + ""))).multiply(percent));
			}
		}
		return total;
	}
}
