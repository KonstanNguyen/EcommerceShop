package com.ecommerce.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

import javax.persistence.criteria.Order;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.bean.Mailer;
import com.ecommerce.dto.response.OrderDetailsDTO;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Invoice;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.CartService;
import com.ecommerce.service.InvoiceService;
import com.ecommerce.service.MailerService;
import com.ecommerce.service.OrdersService;

@Controller
@RequestMapping
public class CheckoutController {

	@Autowired
	InvoiceService invoiceService;

	@Autowired
	SessionFactory factory;

	@Autowired
	CartService cartService;
	@Autowired
	OrdersService ordersService;
	@Autowired
	MailerService mailer;

	@RequestMapping("checkout")
	public String index(HttpServletRequest request, ModelMap model) {

		HttpSession session = request.getSession();
		EcoUser user = (EcoUser) session.getAttribute("user");
		Cart cart = cartService.findCartUnpurchased(user.getId());

		model.addAttribute("cart", cart);
		
//		List<Orders> orders = cart.getOrders().stream().toList();
//		BigDecimal total = BigDecimal.ZERO;
//		for (Orders order : orders) {
//			BigDecimal percent = new BigDecimal(100 - order.getTotalPromotion()).divide(new BigDecimal(100));
//			if (order.getCategories().getPromotionPrice() != null) {
//				System.out.println(percent);
//				total = total.add(new BigDecimal(
//						order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + "")))
//						.multiply(percent));
//			} else {
//				total = total.add(new BigDecimal(
//						order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + "")))
//						.multiply(percent));
//			}
//		}
		BigDecimal total = getTotal(session, cart);
		Invoice invoice = new Invoice();
		invoice.setEmail(user.getEmail());
		invoice.setAddress(user.getAddress());
		invoice.setName(user.getName());
		invoice.setPhone(user.getPhone());
		request.setAttribute("ecoInvoice", invoice);
		request.setAttribute("total", total);
		
		return "home/pages/checkout";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String index(HttpServletRequest request, @ModelAttribute("ecoInvoice") Invoice invoice) {
		HttpSession session = request.getSession();
		EcoUser user = (EcoUser) session.getAttribute("user");
		Cart cart = cartService.findCartUnpurchased(user.getId());
		Random randomNumbers = new Random();
		invoice.setId(String.valueOf(randomNumbers.nextInt(0, 9999)));
		invoice.setDate(Date.from(LocalDate.now().atStartOfDay().atZone(ZoneId.systemDefault()).toInstant()));
		invoice.setTotalAmount(getTotal(session, cart));
		
		if (invoiceService.insertInvoice(invoice) == true) {
			request.setAttribute("message", "Them thanh cong");
		} else {
			request.setAttribute("message", "Them that bai");
		}
		
		for (Orders order : cart.getOrders()) {
			order.setInvoice(invoice);
			ordersService.updateInvoiceIdInOrder(order);
		}
		cart.setStatus(true);
		cartService.updateCart(cart);
		String to = invoice.getEmail(); String subject = "Cảm ơn bạn đã đặt hàng";
		Mailer mail = new Mailer(cart, invoice); 
		String body = mail.getBody();
		mailer.send("no-reply@ecommerce.com", to, subject, body);
		return "redirect:/brands.htm";
	}

	@RequestMapping("showOrders")
	public String showorder(HttpServletRequest request) {
		HttpSession session = request.getSession();
		EcoUser user = (EcoUser) session.getAttribute("user");
		List<Cart> carts = cartService.fetchAll().stream().filter(c -> c.getUsername().getId() == user.getId())
				.filter(c -> c.getStatus().equals(true)).collect(Collectors.toList());

		List<OrderDetailsDTO> orderDetails = ordersService.getOrderDetailsDTO(carts);
//		List<Orders> orders = ordersService.fetchAll().stream().filter(o -> o.getCart().getUsername().equals(user))
//				.collect(Collectors.toList());
		request.setAttribute("orderDetails", orderDetails);
//		request.setAttribute("orders", orders);
		return "home/pages/showOrders";
	}

	/*
	 * @ModelAttribute("total") public BigDecimal getTotal(HttpSession session) {
	 * BigDecimal total = BigDecimal.ZERO; EcoUser user = (EcoUser)
	 * session.getAttribute("user"); if (session.getAttribute("user") == null) {
	 * return null; } Cart cart = cartService.findCartUnpurchased(user.getId());
	 * List<Orders> orders = ordersService.getOrdersByCartId(cart.getId());
	 * 
	 * for (Orders order : orders) { Short totaldealPercent = 0; if
	 * (order.getCategories().getPromotions() != null) { Date now = new Date();
	 * totaldealPercent = order.getCategories().getPromotions().stream().distinct()
	 * .filter(p -> p.getStartTime().before(now) && p.getEndTime().after(now))
	 * .map(p -> p.getDealPercent()).reduce((short) 0, (a, b) -> (short) (a + b)); }
	 * 
	 * BigDecimal percent = new BigDecimal(100 - totaldealPercent).divide(new
	 * BigDecimal(100)); if (order.getCategories().getPromotionPrice() != null) {
	 * System.out.println(percent); total = total.add(new BigDecimal(
	 * order.getCategories().getPromotionPrice().multiply(new
	 * BigInteger(order.getQuantity() + ""))) .multiply(percent)); } else { total =
	 * total.add(new BigDecimal( order.getCategories().getPrice().multiply(new
	 * BigInteger(order.getQuantity() + ""))) .multiply(percent)); } } return total;
	 * }
	 */
	public BigDecimal getTotal(HttpSession session, Cart cart) {
		List<Orders> orders = cart.getOrders().stream().toList();
		BigDecimal total = BigDecimal.ZERO;
		for (Orders order : orders) {
			BigDecimal percent = new BigDecimal(100 - order.getTotalPromotion()).divide(new BigDecimal(100));
			if (order.getCategories().getPromotionPrice() != null) {
				System.out.println(percent);
				total = total.add(new BigDecimal(
						order.getCategories().getPromotionPrice().multiply(new BigInteger(order.getQuantity() + "")))
						.multiply(percent));
			} else {
				total = total.add(new BigDecimal(
						order.getCategories().getPrice().multiply(new BigInteger(order.getQuantity() + "")))
						.multiply(percent));
			}
		}
		return total;
	}
}
