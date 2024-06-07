package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.entity.Category;
import com.ecommerce.service.CategoryService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	CategoryService category;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView v = new ModelAndView("admin/home");
		return v;
	}
	
	@RequestMapping(value = "/orders")
	public ModelAndView orderList() {
		ModelAndView v = new ModelAndView("admin/orders");
		return v;
	}
	
	@RequestMapping(value = "/orderDetails")
	public ModelAndView getOrderDetails() {
		ModelAndView v = new ModelAndView("admin/orderDetails");
		return v;
	}
	
	@RequestMapping(value = "/brands")
	public ModelAndView brandList() {
		ModelAndView v = new ModelAndView("admin/brands");
		return v;
	}
	
	@RequestMapping(value = "/products")
    public String listProducts(Model model) {
        List<Category> productList = category.fetchAllProduct();
        model.addAttribute("products", productList);
        return "admin/products";
    }
	
	@RequestMapping(value = "/promotions")
	public ModelAndView promotionList() {
		ModelAndView v = new ModelAndView("admin/promotions");
		return v;
	}
	
	@RequestMapping(value = "/reports")
	public ModelAndView getReports() {
		ModelAndView v = new ModelAndView("admin/reports");
		return v;
	}
}
