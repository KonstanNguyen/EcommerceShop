package com.ecommerce.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ecommerce.entity.Need;
import com.ecommerce.service.NeedService;

@Controller
@RequestMapping("task")
public class TaskController {
	@Autowired
	NeedService service;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		List<Need> tasks = service.fetchAll();
		model.addAttribute("tasks", tasks);
		return "task";
	}
	
	@RequestMapping("tasks")
	public String index(ModelMap model, @PathVariable("id") int id) {
		Need task = service.findById(id);
		model.addAttribute("task", task);
		return "task";
	}
}
