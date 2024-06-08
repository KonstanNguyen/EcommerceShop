package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Promotion;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.PromotionService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	CategoryService category;
	
	@Autowired
	BrandService brand;
	
	@Autowired
	PromotionService promotion;
	
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
		model.addAttribute("promotions", promList);
		return "admin/promotions";
	}
	
	@RequestMapping(value = "/reports")
	public ModelAndView getReports() {
		ModelAndView v = new ModelAndView("admin/reports");
		return v;
	}
}
