package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.dto.response.OrderDetailsDTO;
import com.ecommerce.entity.Cart;
import com.ecommerce.entity.Orders;

public interface OrdersDAO {
	public List<Orders> fetchAll();
	public List<Orders> getOrdersByCartId(int id);
	public boolean updateInvoiceIdInOrder(Orders orders);
	public List<OrderDetailsDTO> getOrderDetailsDTO(List<Cart> c);
}
