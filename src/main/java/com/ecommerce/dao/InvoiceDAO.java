package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.Invoice;

public interface InvoiceDAO {
	public List<Invoice> fetchAll();
}
