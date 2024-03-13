package com.web.ecommerce.controllers;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.ecommerce.entities.Brand;
import com.web.ecommerce.services.BrandService;
import com.web.ecommerce.services.impl.BrandServiceImpl;

@Controller
@RequestMapping("brand")
public class BrandController {
	
	BrandService service = new BrandServiceImpl();
	public String index() {
		return "index";
	}
	
	@RequestMapping()
	public String formBrand(ModelMap model) {
		List<Brand> brands = service.fetchAll();
		model.addAttribute("brands", brands);
		return "brand";
	}
	
	@RequestMapping("update")
	public String update() {
		
		return "update";
	}
}
