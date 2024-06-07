package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.EcoUser;

public interface UserService {
	public List<EcoUser> fetchAll();
	public EcoUser findByUsername(String username);
}
