package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
	private SqlSessionFactory sqlMapper;
	
	
	public List<AdminDTO> adminSalesOfWeek(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminDTO> list = session.selectList("salesofweek", map);
		
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
	
		return null;
	}
	
	public List<AdminPaymentDTO> mainPaymentList() throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			List<AdminPaymentDTO> list = session.selectList("mainPaymentList");
			
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	public List<AdminNoticeDTO> mainNoticeList() throws Exception {
		SqlSession session = sqlMapper.openSession();
		try{
			
			List<AdminNoticeDTO> list = session.selectList("mainNoticeList");
			
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	public List<AdminQnaDTO> mainQnaList() throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			List<AdminQnaDTO> list = session.selectList("mainQnaList");
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		 return null;
		
	}
	
	
	// 차트
	public List<AdminPaymentDTO> mainPaymentChart(List<HashMap<String, Object>> params) throws Exception{
		SqlSession session = sqlMapper.openSession();
		try {
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminPaymentDTO> list = session.selectList("mainPaymentChart", map);
			
			return list;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	public List<AdminUsersDTO> mainUsersChart(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminUsersDTO> list = session.selectList("mainUserChart", map);
			
			return list;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
		
	}
	
	public List<AdminGalleryDTO> mainGalleryChart(List<HashMap<String, Object>> params) throws Exception {
			SqlSession session = sqlMapper.openSession();
			try {
				
				Map<String, String> map = new HashMap<String, String>();
				
				for(int i = 0; i < params.size(); i++) {
					map.put("startDate", (String) params.get(i).get("startDate"));
					map.put("endDate", (String) params.get(i).get("endDate"));
				}
				
				List<AdminGalleryDTO> list = session.selectList("mainGalleryChart", map);
				
				return list;
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
		
		return null;
	}
	
}
