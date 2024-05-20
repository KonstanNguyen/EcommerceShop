package com.ecommerce.entity;

public class Product {
	private int serialNumber;
	private int categoryId;
	private int warrantyId;
	private int invoiceId;
	public int getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getWarrantyId() {
		return warrantyId;
	}
	public void setWarrantyId(int warrantyId) {
		this.warrantyId = warrantyId;
	}
	public int getInvoiceId() {
		return invoiceId;
	}
	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}
	
}
