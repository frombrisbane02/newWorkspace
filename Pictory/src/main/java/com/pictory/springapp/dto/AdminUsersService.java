package com.pictory.springapp.dto;

import java.util.HashMap;

import java.util.List;

import com.pictory.springapp.dto.AdminCriteriaDTO;

public interface AdminUsersService {
	
	public List<AdminUsersDTO> getUserList(HashMap<String, Object> params) throws Exception;

	public List<AdminUsersDTO> searchList(HashMap<String, Object> params) throws Exception;
	
	public boolean updateEnabled(HashMap<String, Object> params) throws Exception;
	
	public List<AdminUsersDTO> usersChart(List<HashMap<String, Object>> params) throws Exception;
	
	public List<AdminUsersDTO> readMember(String id)  throws Exception;
	
	// 전체 갯수
	public int getUsersCount() throws Exception;
	// 검색 갯수
	public int getSearchUsersCount(HashMap<String, Object> hashMap) throws Exception;
	
}
