package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Orders;

public interface OrdersService {
	public List<Orders> getOrdersByCartId(int id);
}
