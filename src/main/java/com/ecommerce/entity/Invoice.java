package com.ecommerce.entity;

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
	private BigInteger total_amount;

	@OneToMany(mappedBy = "invoice", fetch = FetchType.EAGER)
	private Collection<Orders> orders; 

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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public BigInteger getTotalAmount() {
		return total_amount;
	}

	public void setTotalAmount(BigInteger total_amount) {
		this.total_amount = total_amount;
	}

	public BigInteger getTotal_amount() {
		return total_amount;
	}

	public void setTotal_amount(BigInteger total_amount) {
		this.total_amount = total_amount;
	}

	public Collection<Orders> getOrders() {
		return orders;
	}

	public void setOrders(Collection<Orders> orders) {
		this.orders = orders;
	}


}
