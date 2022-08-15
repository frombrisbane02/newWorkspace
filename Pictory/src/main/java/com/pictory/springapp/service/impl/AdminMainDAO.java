package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminDTO;
import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminUsersDTO;

@Repository("adminmainDAO")
public class AdminMainDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public List<AdminDTO> adminSalesOfWeek(List<HashMap<String, Object>> params) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i < params.size(); i++) {
			map.put("startDate", (String) params.get(i).get("startDate"));
			map.put("endDate", (String) params.get(i).get("endDate"));
		}
		
		List<AdminDTO> list = template.selectList("salesofweek", map);
	
		return list;
	}
	
	public List<AdminPaymentDTO> mainPaymentList() throws Exception {
		
		
		List<AdminPaymentDTO> list = template.selectList("mainPaymentList");
		
		return list;
	}
	
	public List<AdminNoticeDTO> mainNoticeList() throws Exception {
		
		List<AdminNoticeDTO> list = template.selectList("mainNoticeList");
		
		return list;
	}
	
	public List<AdminQnaDTO> mainQnaList() throws Exception {
		
		List<AdminQnaDTO> list = template.selectList("mainQnaList");
		return list;
		
	}
	
	
	// 차트
	public List<AdminPaymentDTO> mainPaymentChart(List<HashMap<String, Object>> params) throws Exception{
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i < params.size(); i++) {
			map.put("startDate", (String) params.get(i).get("startDate"));
			map.put("endDate", (String) params.get(i).get("endDate"));
		}
		
		List<AdminPaymentDTO> list = template.selectList("mainPaymentChart", map);
		
		return list;
	}
	
	public List<AdminUsersDTO> mainUsersChart(List<HashMap<String, Object>> params) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i < params.size(); i++) {
			map.put("startDate", (String) params.get(i).get("startDate"));
			map.put("endDate", (String) params.get(i).get("endDate"));
		}
		
		List<AdminUsersDTO> list = template.selectList("mainUserChart", map);
		
		return list;
		
	}
	
	public List<AdminGalleryDTO> mainGalleryChart(List<HashMap<String, Object>> params) throws Exception {
			
		Map<String, String> map = new HashMap<String, String>();
		
		for(int i = 0; i < params.size(); i++) {
			map.put("startDate", (String) params.get(i).get("startDate"));
			map.put("endDate", (String) params.get(i).get("endDate"));
		}
		
		List<AdminGalleryDTO> list = template.selectList("mainGalleryChart", map);
		
		return list;
	}
	
}
