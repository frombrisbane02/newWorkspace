package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

import com.pictory.springapp.dto.AdminUsersDTO;

public interface AdminUsersService {
	public List<AdminUsersDTO> getUserList() throws Exception;
	public List<AdminUsersDTO> searchList(AdminUsersDTO params) throws Exception;
	public boolean updateEnabled(AdminUsersDTO params) throws Exception;
	public List<AdminUsersDTO> usersChart(List<HashMap<String, Object>> params) throws Exception;
	public AdminUsersDTO readMember(String id)  throws Exception;
}
