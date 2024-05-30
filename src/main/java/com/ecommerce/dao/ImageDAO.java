package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Image;

public interface ImageDAO {
    public List<Image> fetchAll(int ID);
}
