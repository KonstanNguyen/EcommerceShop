package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Image;

public interface ImageDAO {
	public Image findFirstImageByCategoryId(int ID);
    public List<Image> fetchAll(int ID);
}
