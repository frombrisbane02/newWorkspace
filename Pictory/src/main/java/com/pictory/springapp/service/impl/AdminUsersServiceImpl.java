package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Service
public class AdminUsersServiceImpl implements AdminUsersService{

	@Override
	public List<AdminUsersDTO> getUserList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateEnabled(AdminUsersDTO params) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<AdminUsersDTO> searchList(AdminUsersDTO params) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	@Autowired
//	private AdminUsersDAO adminuserDAO;
//	
//	@Override
//	public List<AdminUsersDTO> getUserList() {
//		return adminuserDAO.userList();
//	}
//
//	@Override
//	@Transactional
//	public boolean updateEnabled(AdminUsersDTO params) {
//		
//		int queryResult = 0;
//		queryResult = adminuserDAO.updateEnabled(params);
//		return (queryResult == 1) ? true : false;
//	}
//
//	@Override
//	public List<AdminUsersDTO> searchList(AdminUsersDTO params) {
//		List<AdminUsersDTO> searchList = adminuserDAO.searchList(params);
//		return searchList;
//	}
}
