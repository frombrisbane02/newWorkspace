package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminSalesSellDTO;
import com.pictory.springapp.dto.AdminSalesSellService;

@Service
public class AdminSalesSellServiceImpl implements AdminSalesSellService{
	
	@Autowired
	private AdminSalesSellDAO SalesSellDAO;
	
	@Override
	public List<AdminSalesSellDTO> getSalesSellList() {
		return SalesSellDAO.SalesSellList();
	}

	@Override
	public List<AdminSalesSellDTO> searchList(AdminSalesSellDTO params) {
		List<AdminSalesSellDTO> searchList = SalesSellDAO.searchList(params);
		return searchList;
	}
}
