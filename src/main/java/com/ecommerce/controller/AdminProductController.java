package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Category;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ProductService;

@Controller
@RequestMapping("/something")
public class AdminProductController {
	

	/*
	 * @RequestMapping("/add") public String addProduct(@ModelAttribute Category
	 * product) { productService.addProduct(product); return
	 * "redirect:/admin/products"; }
	 * 
	 * @RequestMapping("/update") public String updateProduct(@ModelAttribute
	 * Category product) { productService.updateProduct(product); return
	 * "redirect:/admin/products"; }
	 * 
	 * @RequestMapping("/delete/{id}") public String
	 * deleteProduct(@PathVariable("id") int id) { productService.deleteProduct(id);
	 * return "redirect:/admin/products"; }
	 * 
	 * @RequestMapping("/edit/{id}") public String editProduct(@PathVariable("id")
	 * int id, Model model) { Category product = productService.getProductById(id);
	 * model.addAttribute("product", product); return "admin/edit_product"; }
	 */
}