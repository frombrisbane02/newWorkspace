package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Service
public class AdminUsersServiceImpl implements AdminUsersService{

	@Autowired
	private AdminUsersDAO adminuserDAO;
	
	@Override
	public List<AdminUsersDTO> getUserList() throws Exception {
			
		try {
			return adminuserDAO.userList();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@Override
	public List<AdminUsersDTO> searchList(AdminUsersDTO params) throws Exception {
		try {
			List<AdminUsersDTO> searchList = adminuserDAO.searchList(params);
			return searchList;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return null;
	}
	
	@Override
	public boolean updateEnabled(AdminUsersDTO params)throws Exception {
		try {
			int queryResult = 0;
			queryResult = adminuserDAO.updateEnabled(params);
			return (queryResult == 1) ? true : false;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return false;
	}
//	

	@Override
	public List<AdminUsersDTO> usersChart(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			List<AdminUsersDTO> list = adminuserDAO.userChart(params);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
