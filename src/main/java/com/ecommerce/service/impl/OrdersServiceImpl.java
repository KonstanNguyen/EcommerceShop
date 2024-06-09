package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.OrdersDAO;
import com.ecommerce.dto.response.OrderDetailsDTO;
import com.ecommerce.entity.Cart;
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
	
	@Override
	public boolean updateInvoiceIdInOrder(Orders orders) {
		return dao.updateInvoiceIdInOrder(orders);
	}

	@Override
	public List<Orders> fetchAll() {
		return dao.fetchAll();
	}
	
	@Override
	public List<OrderDetailsDTO> getOrderDetailsDTO(List<Cart> carts){
		return dao.getOrderDetailsDTO(carts);
	}
	
}
