package com.ecommerce.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ecommerce.dao.ProductDAO;
import com.ecommerce.entity.Category;
import com.ecommerce.service.ProductService;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAO productDAO;

    @Override
    public void addProduct(Category category) {
        productDAO.addProduct(category);
    }

    @Override
    public void updateProduct(Category category) {
        productDAO.updateProduct(category);
    }

    @Override
    public void deleteProduct(int id) {
        productDAO.deleteProduct(id);
    }

    @Override
    public Category getProductById(int id) {
        return productDAO.getProductById(id);
    }

    public List<Category> getAllProducts() {
        return productDAO.getAllProducts();
    }
}
