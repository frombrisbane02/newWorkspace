package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminPaymentService;
import com.pictory.springapp.dto.PageDTO;

@Service
public class AdminPaymentServiceImpl implements AdminPaymentService {
	
	@Autowired
	private AdminPaymentDAO paymentDAO;
	
	
	

	// 최근거래내역 토탈 카운트
	@Override
	public int paymentTotalCount() throws Exception {
		try {
		
			int result = paymentDAO.paymentTotalCount();
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	// 최근 거래내역 검색 카운트
	@Override
	public int paymentSearchCount(HashMap<String, Object> params) throws Exception {
		try {
			
			int result = paymentDAO.paymentSearchCount(params);
					
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}	
	
	// 전체 리스트
	@Override
	public List<AdminPaymentDTO> paymentList(AdminCriteriaDTO cri) throws Exception {
		
//		int pageNum = (Integer) params.get("pageNum");
//		String keyword = (String) params.get("keyword");
//		int totalCount = paymentDAO.totalCount();
//		PageDTO pageDTO = new PageDTO( pageNum, totalCount, keyword);	
//		int start = pageDTO.getStart();
//		int end = pageDTO.getEnd();
//		params.put("start", start);
//		params.put("end", end);
//		params.put("keyword", keyword);
		
		
//		System.out.println("pageDTO : " + pageDTO);
//		System.out.println("pageNum : " + pageNum);
//		System.out.println("keyword : " + keyword);
//		System.out.println("startPage : " + startPage);
//		System.out.println("endPage : " + endPage);
//		
		
		
		try {
			
			List<AdminPaymentDTO> list = paymentDAO.paymentList(cri);
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	// 최근 거래내역 검색 리스트
	@Override
	public List<AdminPaymentDTO> paymentSearch(HashMap<String, Object> params ) throws Exception {
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
