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
	public EcoUser findByUsername(String username) {
		return dao.findByUsername(username);
	}

}
