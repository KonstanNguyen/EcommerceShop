package com.ecommerce.service;

import java.util.List;

import com.ecommerce.entity.EcoUser;

public interface UserService {
	public List<EcoUser> fetchAll();
	public boolean save(EcoUser user);
	public boolean update(EcoUser user);
	public EcoUser findByUsername(String username);
	public EcoUser findByName(String name);
	public EcoUser findByUsernameAndPassword(String username, String password);
}
