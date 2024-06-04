package com.ecommerce.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecommerce.entity.Category;
import com.ecommerce.entity.Image;
import com.ecommerce.service.CategoryService;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    CategoryService categoryService;
    @RequestMapping
    public String index(@RequestParam("id") int ID, ModelMap model) {
        Category category = categoryService.findByID(ID);
        model.addAttribute("category", category);
        return "home/pages/product";
    }
}


