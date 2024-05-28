package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.OrdersDAO;
import com.ecommerce.entity.Orders;
import com.ecommerce.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	OrdersDAO dao;
	
	@Override
	public List<Orders> getOrdersByCartId(int id) {
		return dao.getOrdersByCartId(id);
	}
	
}
