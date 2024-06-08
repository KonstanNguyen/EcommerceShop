package com.ecommerce.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Brand;
import com.ecommerce.error.DetectedException;
import com.ecommerce.service.BrandService;

@Controller
@RequestMapping("/admin/brands")
public class AdminBrandController {
	
	@Autowired
    BrandService brandService;
	
	@RequestMapping("/add")
    public String addBrand(HttpServletRequest request) {
		String name = request.getParameter("brandName");
		Brand brand = new Brand(name);
		brandService.addBrand(brand);
		
        return "redirect:/admin/brands.htm";
    }

    @RequestMapping(value = "/edit/{id}")
    public String updateBrand(@PathVariable("id") int brandId, HttpServletRequest request) {
        Brand b = brandService.findByID(brandId);
        b.setName(request.getParameter("brandName"));
        System.out.println("Brand: " + b.getName());
        brandService.updateBrand(b);
    	
        return "redirect:/admin/brands.htm";
    }

    @RequestMapping("/delete/{id}")
    public String deleteBrand(@PathVariable("id") int brandId, Model model) {
//    	Brand b = brandService.findByID(brandId);
//    	System.out.println("Brand: " + b.getid() + " - " + b.getName());
//    	brandService.deleteBrand(b);
//        return "redirect:/admin/brands.htm";
        
        try {
            Brand b = brandService.findByID(brandId);
            brandService.deleteBrand(b);
            return "redirect:/admin/brands.htm";
        } catch (DetectedException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "redirect:/admin/brands.htm";
            // You can add additional logic here, like redirecting to an error page or displaying an error message
        }
    }
}
