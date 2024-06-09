package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.InvoiceDAO;
import com.ecommerce.entity.Invoice;
import com.ecommerce.service.InvoiceService;

@Service
public class InvoiceServiceImpl implements InvoiceService {

	@Autowired
	InvoiceDAO dao;
	
	@Override
	public List<Invoice> fetchAll() {
		// TODO Auto-generated method stub
		return dao.fetchAll();
	}

	public boolean insertInvoice(Invoice invoice) {
		return dao.insertInvoice(invoice);
	}
	
}
