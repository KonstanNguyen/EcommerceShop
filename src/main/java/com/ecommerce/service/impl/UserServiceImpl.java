package com.ecommerce.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ecommerce.dao.UserDAO;
import com.ecommerce.entity.EcoUser;
import com.ecommerce.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO dao;
	
	@Override
	public List<EcoUser> fetchAll(){
		return dao.fetchAll();
	}
	
	@Override
	public boolean save(EcoUser user) {
		return dao.save(user);
	}
	
	@Override
	public EcoUser findByUsername(String username) {
		EcoUser user = dao.findByUsername(username);
		return user;
	}
	
	@Override
	public EcoUser findByUsernameAndPassword(String username, String password) {
		return dao.findByUsernameAndPassword(username, password);
	}

}
