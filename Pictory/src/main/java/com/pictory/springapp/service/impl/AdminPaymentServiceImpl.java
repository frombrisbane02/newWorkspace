package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminPaymentService;

@Service
public class AdminPaymentServiceImpl implements AdminPaymentService {
	
	@Autowired
	private AdminPaymentDAO paymentDAO;

	@Override
	public List<AdminPaymentDTO> paymentList() throws Exception {
		
		try {
			
			List<AdminPaymentDTO> list = paymentDAO.paymentList();
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public List<AdminPaymentDTO>  paymentSearch(HashMap<String, Object> params ) throws Exception {
		try {
			
			List<AdminPaymentDTO> list = paymentDAO.paymentSearch(params);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<AdminPaymentDTO> paymentChart(List<HashMap<String, Object>> params) throws Exception {
			
		try {
			
			List<AdminPaymentDTO> list = paymentDAO.paymentChart(params);
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
