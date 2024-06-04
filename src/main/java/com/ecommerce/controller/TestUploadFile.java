package com.ecommerce.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("job")
public class TestUploadFile {
	@Autowired
	ServletContext context;

	@RequestMapping("form")
	public String form() {
		return "job/form";
	}

	/**
	 * @param model
	 * @param name
	 * @param cv
	 * @param photo
	 * @return
	 */
	@RequestMapping(value = "apply", headers=("content-type=multipart/*"), method = { RequestMethod.POST, RequestMethod.GET })
	public String apply(ModelMap model,
			@RequestParam("fullname") String name,
			@RequestParam("cv") MultipartFile cv,
			@RequestParam("photo") MultipartFile photo) {
		if (photo.isEmpty() || cv.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file!");
		}else {
			try {
				String photoPath = context.getContextPath() + "/src/main/webapp/files/" + photo.getOriginalFilename();
				photo.transferTo(new File(photoPath));
				System.out.println(photoPath);
				
				String cvPath = context.getContextPath() + "/src/main/webapp/files/" + cv.getOriginalFilename();
				cv.transferTo(new File(cvPath));
				System.out.println(cvPath);
				
				model.addAttribute("photo_name", photo.getOriginalFilename());
				model.addAttribute("cv_name", cv.getOriginalFilename());
				model.addAttribute("cv_type", photo.getContentType());
				model.addAttribute("cv_size", cv.getSize());
				
				return "job/apply";
			} catch (Exception e) {
				model.addAttribute("message", "Lỗi lưu file!");
			}
		}
		return "job/form";
	}
}
