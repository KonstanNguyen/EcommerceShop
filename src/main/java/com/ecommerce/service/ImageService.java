package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Image;

public interface ImageService {
	public List<Image> fetchAll(int ID);
}
