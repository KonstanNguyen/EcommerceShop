package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.EcoUser;

public interface UserDAO {
	public List<EcoUser> fetchAll();
	public EcoUser findByUsername(String username);
}
