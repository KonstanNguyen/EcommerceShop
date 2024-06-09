package com.ecommerce.dao;

import java.util.List;

import com.ecommerce.entity.EcoUser;

public interface UserDAO {
	public List<EcoUser> fetchAll();
	public boolean save(EcoUser user);
	public EcoUser findByUsername(String username);
	public EcoUser findByUsernameAndPassword(String username, String password);
}
