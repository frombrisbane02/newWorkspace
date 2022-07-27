package com.pictory.springapp.dto;

import java.util.List;

import com.pictory.springapp.dto.AdminUsersDTO;

public interface AdminUsersService {
	public List<AdminUsersDTO> getUserList();
	public boolean updateEnabled(AdminUsersDTO params);
	public List<AdminUsersDTO> searchList(AdminUsersDTO params);
}