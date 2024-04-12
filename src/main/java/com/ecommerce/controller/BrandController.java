package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Brand;
import com.ecommerce.service.BrandService;

@Controller
@RequestMapping("brands")
public class BrandController {
	
	@Autowired
	BrandService service;
	
	@RequestMapping
	public String index(ModelMap model) {
//		List<Brand> brands = service.fetchAll();
//		model.addAttribute("brands", brands);
		return "pages/login";
	}
	
	@RequestMapping("{id}")
	public String brand(@PathVariable("id") int ID, HttpServletRequest req) {
		Brand brand = service.findByID(ID);
		req.setAttribute("brand", brand);
		
		
		return "brand";
	}
}
