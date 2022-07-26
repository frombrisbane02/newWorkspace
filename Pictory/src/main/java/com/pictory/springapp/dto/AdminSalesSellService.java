package com.pictory.springapp.dto;

import java.util.List;

import com.pictory.springapp.dto.AdminSalesSellDTO;


public interface AdminSalesSellService {
	public List<AdminSalesSellDTO> getSalesSellList();
	public List<AdminSalesSellDTO> searchList(AdminSalesSellDTO params);
}
