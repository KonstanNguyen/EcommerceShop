package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Orders;

public interface OrdersDAO {
	public List<Orders> getOrdersByCartId(int id);
}
