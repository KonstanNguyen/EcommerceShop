package com.ecommerce.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.ImageDAO;
import com.ecommerce.entity.Image;
import com.ecommerce.service.ImageService;

@Service
public class ImageServiceImpl implements ImageService{
	@Autowired
	ImageDAO dao;
	@Override
	public List<Image> fetchAll(int ID) {
		return dao.fetchAll(ID);
	}
}
