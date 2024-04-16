package com.ecommerce.entity;

import java.util.Date;

public class Invoice {
	private int id;
	private String taxCode;
	private Date date;
	private int employeeId;
	private int customerId;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTaxCode() {
		return taxCode;
	}
	public void setTaxCode(String taxCode) {
		this.taxCode = taxCode;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
}
