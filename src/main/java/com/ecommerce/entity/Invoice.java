package com.ecommerce.entity;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Invoice {
	@Id
	private String id;
	private String taxCode;
	private Date date;
	private String name;
	private String email;
	private String phone;
	private String address;
	private BigDecimal total_amount;
	
	@OneToMany(mappedBy = "invoice", fetch = FetchType.EAGER)
	private Collection<Orders> orders;

	public Invoice() {
		super();
	}

	public Invoice(String id, String taxCode, Date date, String name, String email, String phone, String address) {
		super();
		this.id = id;
		this.taxCode = taxCode;
		this.date = date;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public BigDecimal getTotalAmount() {
		return total_amount;
	}

	public void setTotalAmount(BigDecimal total_amount) {
		this.total_amount = total_amount;
	}

	public Collection<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Orders> orders) {
		this.orders = orders;
	}

}
