package com.ecommerce.dao;

import com.ecommerce.entity.Invoice;

import java.util.List;

public interface InvoiceDAO {
	public List<Invoice> fetchAll();
	public boolean insertInvoice(Invoice invoice);
}
