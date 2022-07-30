package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminPaymentDTO;

@Repository("adminpaymentDAO")
public class AdminPaymentDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	
	public List<AdminPaymentDTO> paymentList() throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			List<AdminPaymentDTO> list = session.selectList("paymentList");
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	
	public List<AdminPaymentDTO> paymentSearch(HashMap<String, Object> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			List<AdminPaymentDTO> list = session.selectList("paymentSearch", params);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	public List<AdminPaymentDTO> paymentChart(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
					
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminPaymentDTO> list = session.selectList("paymentChart", map);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
}
