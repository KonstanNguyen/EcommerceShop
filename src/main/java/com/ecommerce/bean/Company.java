package com.ecommerce.bean;

import org.springframework.beans.factory.annotation.Autowired;

public class Company {
	private String name;
	private String phone;
	private String email;
	private String address;
	private String description;
	@Autowired
	private Logo logo;
	
	public Company() {}

	public Company(String name, String phone, String email, String address, String description, Logo logo) {
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.description = description;
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Logo getLogo() {
		return logo;
	}

	public void setLogo(Logo logo) {
		this.logo = logo;
	}
	
}
