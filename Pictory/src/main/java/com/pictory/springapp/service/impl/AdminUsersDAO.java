package com.pictory.springapp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminUsersDTO;


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

}
