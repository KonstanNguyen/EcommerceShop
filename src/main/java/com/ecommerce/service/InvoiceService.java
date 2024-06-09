package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.Invoice;

public interface InvoiceService {
	public List<Invoice> fetchAll();
	public boolean insertInvoice(Invoice invoice);
}
