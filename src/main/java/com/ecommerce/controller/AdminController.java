package com.ecommerce.controller;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.entity.Invoice;
import com.ecommerce.entity.Orders;
import com.ecommerce.entity.Promotion;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CartService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.InvoiceService;
import com.ecommerce.service.PromotionService;
import com.ecommerce.service.UserService;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;


@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	UserService user;
	
	@Autowired
	CategoryService category;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	BrandService brand;
	
	@Autowired
	PromotionService promotion;
	
	@Autowired
	InvoiceService invoice;
	
	@RequestMapping()
	public String index(Model model) {
		List<EcoUser> userList = user.fetchAll();
		List<Invoice> invoiceList = invoice.fetchAll();
		model.addAttribute("users", userList);
		model.addAttribute("invoices", invoiceList);
		BigDecimal totalAmount = BigDecimal.ZERO;	
		
		for (Invoice i : invoiceList) {
			totalAmount = totalAmount.add(i.getTotalAmount());
		}
		
		model.addAttribute("total_amount", totalAmount);
		
		return "admin/home";
	}
	
	@RequestMapping(value = "/orders")
	public String orderList(Model model) {
		List<EcoUser> userList = user.fetchAll();
		List<Invoice> invoiceList = invoice.fetchAll();
		model.addAttribute("users", userList);
		model.addAttribute("invoices", invoiceList);
		return "admin/orders";
	}
	
	@RequestMapping(value = "/orderDetails", method= {RequestMethod.GET, RequestMethod.POST})
	public String getOrderDetails(Model model, @RequestParam("name") String name, @RequestParam("id") int cartId) {
		EcoUser u = user.findByName(name);
		Cart c = cartService.findById(cartId);
		List<Orders> orders = c.getOrders().stream().distinct().toList();
		model.addAttribute("orders", orders);
		model.addAttribute("user", u);
		model.addAttribute("cart", c);
		return "admin/orderDetails";
	}
	
	@RequestMapping(value = "/brands")
	public String brandList(Model model) {
		List<Brand> brandList = brand.fetchAll();
		model.addAttribute("brands", brandList);
		
		return "admin/brands";
	}
	
	@RequestMapping(value = "/products")
    public String productList(Model model) {
        List<Category> productList = category.fetchAllProduct();
        List<Brand> brandList = brand.fetchAll();
        model.addAttribute("products", productList);
        model.addAttribute("brands", brandList);
        return "admin/products";
    }
	
	@RequestMapping(value = "/promotions")
	public String promotionList(Model model) {
		List<Promotion> promList = promotion.fetchAll();
		List<Category> categoryList = category.fetchAllProduct();
		model.addAttribute("promotions", promList);
		model.addAttribute("categories", categoryList);
		return "admin/promotions";
	}
	
	@RequestMapping(value = "/reports")
	public String getReports() {
		return "admin/reports";
	}
}
