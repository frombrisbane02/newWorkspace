package com.pictory.springapp.service.impl;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Service
public class AdminUsersServiceImpl implements AdminUsersService{

	@Autowired
	private AdminUsersDAO adminuserDAO;
	
	
	//회원정보보기
	@Override
	public List<AdminUsersDTO> readMember(String id) throws Exception {
		try {
			
		  List<AdminUsersDTO> result = adminuserDAO.readMember(id);
		  
		  return result;
		  
		}catch(Exception e) {
			e.printStackTrace();
		}
			return null;
	}
	
	
	// 회원 전체 갯수
	@Override
	public int getUsersCount() throws Exception {
		
		try {
			return adminuserDAO.usersCount();
		}catch (Exception e) {
			e.printStackTrace();
		}
	
			return 0;
	}
	
	// 회원 전체 조회
	@Override
	public List<AdminUsersDTO> getUserList(HashMap<String, Object> params) throws Exception {
		try {
			return adminuserDAO.userList(params);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	// 회원 검색 갯수
	@Override
	public int getSearchUsersCount(HashMap<String, Object> params) throws Exception {
		try {
			
			return adminuserDAO.searchUsersCount(params);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 검색 회원 리스트
	@Override
	public List<AdminUsersDTO> searchList(HashMap<String, Object> params) throws Exception {
		try {
			List<AdminUsersDTO> searchList = adminuserDAO.searchList(params);
			return searchList;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return null;
	}
	
	@Override
	public boolean updateEnabled(HashMap<String, Object> params)throws Exception {
		try {
			int queryResult = 0;
			queryResult = adminuserDAO.updateEnabled(params);
			return (queryResult == 1) ? true : false;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return false;
	}

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
