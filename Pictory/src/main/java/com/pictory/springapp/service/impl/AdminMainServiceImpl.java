package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminDTO;
import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminMainService;
import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminUsersDTO;

@Service
public class AdminMainServiceImpl implements AdminMainService{
	
	@Autowired
	private AdminMainDAO mainDAO;
	
	@Override
	public List<AdminDTO> adminSalesOfWeek(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			List<AdminDTO> list = mainDAO.adminSalesOfWeek(params);
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	

	@Override
	public List<AdminPaymentDTO> adminPaymentList() throws Exception {
			
		try {
			
			List<AdminPaymentDTO> list = mainDAO.mainPaymentList();
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<AdminNoticeDTO> adminNoticeList() throws Exception {
		
		try {
			
			List<AdminNoticeDTO> list = mainDAO.mainNoticeList();
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<AdminQnaDTO> adminQnaList() throws Exception {
		
		try {
			
			List<AdminQnaDTO> list = mainDAO.mainQnaList();
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	
	// 차트
	@Override
	public List<AdminPaymentDTO> adminPaymentChart(List<HashMap<String, Object>> params) throws Exception {
			
		try {
			
			List<AdminPaymentDTO> list = mainDAO.mainPaymentChart(params);
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<AdminUsersDTO> adminUsersChart(List<HashMap<String, Object>> params) throws Exception {
		
		
		try {
			
			List<AdminUsersDTO> list = mainDAO.mainUsersChart(params);
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<AdminGalleryDTO> adminGalleryChart(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			List<AdminGalleryDTO> list = mainDAO.mainGalleryChart(params);
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
