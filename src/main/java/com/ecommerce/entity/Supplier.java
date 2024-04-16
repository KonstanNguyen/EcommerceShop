package com.ecommerce.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;

@Entity
public class Supplier {
	@Id
	private int id;
	private String name;
	private String email;
	private String phone;
	private String address;
	@OneToMany(mappedBy = "supplier", fetch = FetchType.EAGER)
	private Collection<Categories_Suppliers> categories_Suppliers;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
}
