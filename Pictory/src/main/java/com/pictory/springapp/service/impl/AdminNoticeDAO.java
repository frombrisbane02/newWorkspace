package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminNoticeDTO;

@Repository("adminnoticeDAO")
public class AdminNoticeDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
			
	public List<AdminNoticeDTO> noticeList(HashMap<String, Object> map) throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			List<AdminNoticeDTO> list = session.selectList("noticeList", map);
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	
	@Transactional
	public boolean noticeInsert(List<HashMap<String, Object>> map) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			 boolean result = false;
			
			for(int i = 0; i < map.size(); i++) {
				int list = session.insert("noticeInsert", map.get(i));
				
				if(list == 1) {
					result = true;
				}
			}
			
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
			return false;
	}
	
	@Transactional
	public boolean noticeUpdate(HashMap<String, Object> map) throws Exception {
		 SqlSession session = sqlMapper.openSession();
		try {
			
			boolean result = false;
			int check = session.update("noticeUpdate", map);
			
			if(check == 1) {
				result = true;
			}
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		 return false;
	}
	
	@Transactional
	public boolean noticeDelete(int map) throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
		 
			boolean result = false;
			int check = session.delete("noticeDelete", map);
			
			if(check == 1) {
				result = true;
			}
			
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
			return false;
		
	}

}
