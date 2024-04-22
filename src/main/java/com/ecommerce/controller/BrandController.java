package com.ecommerce.controller;

import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
		model.addAttribute("brands", brands);
		model.addAttribute("categories", categories);
		
		LocalDateTime countDownDate = LocalDateTime.of(2020, Month.JANUARY, 5, 15, 37, 25, 0);
		model.addAttribute("countDownDate", countDownDate.format(DateTimeFormatter.ofPattern("dd-MM-yyyy hh:mm:ss")).toString());
		
		return "home/pages/home";	
//		return "pages/login";
	}
	
	@RequestMapping("{id}")
	public String brand(@PathVariable("id") int ID, HttpServletRequest req) {
		Brand brand = service.findByID(ID);
		req.setAttribute("brand", brand);
		
		
		return "brand";
	}
}
