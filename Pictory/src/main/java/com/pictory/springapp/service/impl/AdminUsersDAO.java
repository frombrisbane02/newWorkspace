package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.MemberDTO;


@Repository("adminusersDAO")
public class AdminUsersDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;	
	
	public List<AdminUsersDTO> userList() throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			return session.selectList("userList");

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
		
	}
	
	public AdminUsersDTO readMember(String id) {
		SqlSession session= sqlMapper.openSession();
		AdminUsersDTO adminUsersDTO = session.selectOne("readUser", id);
		return adminUsersDTO;
	}
	
	public List<AdminUsersDTO> searchList(AdminUsersDTO keyword)throws Exception {
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			List<AdminUsersDTO> list = session.selectList("searchList", keyword);			
			return list;  
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
		
	}
	
	public int updateEnabled(AdminUsersDTO params) throws Exception{
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			return session.update("updateEnabled", params);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return 0;
	}
	
	
	public List<AdminUsersDTO> userChart(List<HashMap<String, Object>> params) throws Exception {
			SqlSession session = sqlMapper.openSession();
		try {
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminUsersDTO> list = session.selectList("userChart", map);
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}

}
