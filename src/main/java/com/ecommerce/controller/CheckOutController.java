package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ecommerce.service.OrderService;

@Controller
@RequestMapping("checkout")
public class CheckOutController {
	@Autowired
	OrderService orderService;
	@RequestMapping(method = RequestMethod.POST)
	public String checkOut(HttpServletRequest request) {
	    String[] orderIDParams = request.getParameterValues("orderID");
	    String[] quantityParams = request.getParameterValues("quantity");
	    if (orderIDParams == null || quantityParams == null) {
	    	return "redirect:/brands.htm";
	    }
		for (int i = 0; i < orderIDParams.length; i++) {
			int orderID = Integer.parseInt(orderIDParams[i]);
			int quantity = Integer.parseInt(quantityParams[i]);
			orderService.updateQuantity(orderID, quantity);
		}
		return "redirect:/checkout.htm";
	}
}
