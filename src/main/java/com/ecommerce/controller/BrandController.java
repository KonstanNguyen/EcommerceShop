package com.ecommerce.controller;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;

@Controller
@RequestMapping("brands")
public class BrandController {
	
	@Autowired
	BrandService service;
	
	@Autowired
	CategoryService categoryService;
	
	@RequestMapping
	public String index(
//			@RequestParam("page") int page, 
//			@RequestParam("limit") int limit, 
			ModelMap model) {
		List<Brand> brands = service.fetchAll();
		List<Category> categories = categoryService.fetchAll();
		Integer pagesize = 3;
		Integer pageTotal = (int)Math.ceil((double)categories.size()/pagesize);
		for (int i = 0; i < pageTotal; i++) {
			
		}
		List<Category> categoriesPage = categoryService.fetchPageTopSelling(0, 2);
		List<Category> categoriesPage2 = categoryService.fetchPageTopSelling(1, 2);
		model.addAttribute("brands", brands);
		model.addAttribute("categories", categoriesPage);
		model.addAttribute("categories2", categoriesPage2);
		
		LocalDateTime countDownDate = LocalDateTime.of(2020, Month.JANUARY, 5, 15, 37, 25, 0);
		model.addAttribute("countDownDate", countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString());
		
		return "home/pages/home";	
//		return "pages/login";
	}
	
//	@RequestMapping
//	public String brand(@RequestParam(defaultValue = "1") int id, HttpServletRequest req) {
//		Brand brand = service.findByID(id);
//		req.setAttribute("brand", brand);
//		
//		
//		return "brand";
//	}
}
