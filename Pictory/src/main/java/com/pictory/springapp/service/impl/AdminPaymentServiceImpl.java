package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminPaymentService;
import com.pictory.springapp.dto.PageDTO;

@Service
public class AdminPaymentServiceImpl implements AdminPaymentService {
	
	@Autowired
	private AdminPaymentDAO paymentDAO;

	@Override
	public List<AdminPaymentDTO> paymentList(HashMap<String, Object> params) throws Exception {
		
		int pageNum = (Integer) params.get("pageNum");
		String keyword = (String) params.get("keyword");
		
		int totalCount = paymentDAO.totalCount();
		
		PageDTO pageDTO = new PageDTO( pageNum, totalCount, keyword);
		
		int start = pageDTO.getStart();
		int end = pageDTO.getEnd();
		
		params.put("start", start);
		params.put("end", end);
		params.put("keyword", keyword);
		
		
		System.out.println("pageDTO : " + pageDTO);
//		System.out.println("pageNum : " + pageNum);
//		System.out.println("keyword : " + keyword);
//		System.out.println("startPage : " + startPage);
//		System.out.println("endPage : " + endPage);
//		
		
		
		try {
			
			List<AdminPaymentDTO> list = paymentDAO.paymentList(params);
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

	@Override
	public int totalCount() throws Exception {
		try {
			
			int count = paymentDAO.totalCount();
			return count;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
