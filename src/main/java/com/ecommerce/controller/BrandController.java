package com.ecommerce.controller;

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
	public String index(ModelMap model) {
		int MAX_SIZE = 100;
		List<Brand> brands = service.fetchAll();
		List<Category> categories = categoryService.fetchAll();
		model.addAttribute("brands", brands);
		model.addAttribute("categories", categories);
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
