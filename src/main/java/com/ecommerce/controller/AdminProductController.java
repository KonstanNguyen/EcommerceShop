package com.ecommerce.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.ecommerce.consts.CategoryStatus;
import com.ecommerce.entity.Brand;
import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.service.BrandService;
import com.ecommerce.service.CategoryService;
import com.ecommerce.service.ImageService;

import java.io.File;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/products")
public class AdminProductController {

    @Autowired
    CategoryService categoryService;
    
    @Autowired
    BrandService brandService;
    
    @Autowired
    ImageService imageService;
    
    @Autowired
    ServletContext context;

    @RequestMapping(value = "/add", headers=("content-type=multipart/*"), method = { RequestMethod.POST, RequestMethod.GET })
    public String addCategory(ModelMap model, HttpServletRequest request, @RequestParam("image") MultipartFile[] images) {
    	String name = request.getParameter("productName");
    	String brand = request.getParameter("brand");
    	String cpu = request.getParameter("cpu");
    	String ram = request.getParameter("ram");
    	String hardware = request.getParameter("hardware");
    	String card = request.getParameter("card");
    	String screen = request.getParameter("screen");
    	String os = request.getParameter("os");
    	boolean hot = Boolean.valueOf(request.getParameter("hot"));
    	BigInteger price = new BigInteger (request.getParameter("price"));
    	BigInteger promotionPrice = new BigInteger(request.getParameter("promotionPrice"));
    	int warrantyTime = Integer.parseInt(request.getParameter("warrantyTime"));
    	String description = request.getParameter("description");
    	CategoryStatus status = CategoryStatus.valueOf(request.getParameter("status"));
    	float rating = Float.valueOf(request.getParameter("rating"));
    	
    	Category c = new Category(name, cpu, ram, hardware, card, screen, os, hot, price, promotionPrice, warrantyTime, description, status, rating);
    	Brand b = brandService.findByName(brand);
    	c.setBrand(b);
    	categoryService.addCategory(c);

    	Category new_c = categoryService.findByName(name);
    	
    	for (MultipartFile image : images) {
    		if (image.isEmpty()) {
    			model.addAttribute("message", "Vui lòng chọn file!");
    			return "uploadStatus";
    		}
    		
    		try {
    			String realPath = context.getRealPath("/assets/img/");
    			System.out.println("Path: " + realPath);
    			File directory = new File(realPath);
    			
    			if (!directory.exists()) {
    				directory.mkdirs();
    			}
    			
    			String filePath = realPath + File.separator + image.getOriginalFilename();
    			File destinationFile = new File(filePath);
    			image.transferTo(destinationFile);
    			
    			Image img = new Image("./assets/img/" + image.getOriginalFilename(), new_c);
    			imageService.addImage(img);
    			
    			model.addAttribute("message", "Tải file thành công!");
    		} catch (Exception e) {
    			model.addAttribute("message", "Lỗi lưu file!");
    			e.printStackTrace();
    		}
    	}
    	
    	
        return "redirect:/admin/products.htm";
//    	return "";
    }

    @RequestMapping(value = "/edit/{id}", headers=("content-type=multipart/*"), method = { RequestMethod.POST, RequestMethod.GET })
    public String updateCategory(@PathVariable("id") int categoryId, HttpServletRequest request) {
        Category c = categoryService.findByID(categoryId);
        c.setTitle(request.getParameter("productName"));
        Brand b = brandService.findByName(request.getParameter("brand"));
        c.setBrand(b);
        c.setCPU(request.getParameter("cpu"));
        c.setRAM(request.getParameter("ram"));
        c.setCARD(request.getParameter("card"));
        c.setHARDWARE(request.getParameter("hardware"));
        c.setSCREEN(request.getParameter("screen"));
        c.setOS(request.getParameter("os"));
        c.setHot(Boolean.valueOf(request.getParameter("hot")));
        c.setPrice(new BigInteger (request.getParameter("price")));
        c.setPromotionPrice(new BigInteger (request.getParameter("promotionPrice")));
        c.setWarrantyTime(Integer.parseInt(request.getParameter("warrantyTime")));
        c.setDescription(request.getParameter("description"));
        c.setStatus(CategoryStatus.valueOf(request.getParameter("status")));
        c.setStarts(Float.valueOf(request.getParameter("rating")));
        
//        System.out.println("Category: " + c.toString());
        
        request.setAttribute("images", c.getImages().stream().collect(Collectors.toList()));
        
        categoryService.updateCategory(c);
        System.out.println("Sau khi update");
        return "redirect:/admin/products.htm";
    }

    @RequestMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") int categoryId) {
    	Category c = categoryService.findByID(categoryId);
        c.setStatus(CategoryStatus.valueOf("DELETED"));
        categoryService.updateCategory(c);
        return "redirect:/admin/products.htm";
    }
}
