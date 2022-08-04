package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminQnaDTO;

@Repository("adminqnaDAO")
public class AdminQnaDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	public List<AdminQnaDTO> qnaList(HashMap<String, Object> map) throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			List<AdminQnaDTO> list = session.selectList("qnaList", map);
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return null;
	}
	
	
	@Transactional
	public boolean qnaAnswer(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			boolean result = false;
			int check = 0;
			
			check = session.insert("adminQnaAnswer", params.get(0));
			
			if(check > 0) {
				result = true;
			}
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
			return false;
	}
	
	
	@Transactional
	public boolean qnaAnswerUpdate(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			boolean result = false;
		
			int check = session.update("adminQnaAnswerUpdate", params.get(0));
			
			if(check > 0) {
				result = true;
			}

			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
			return false;
	}
	
	@Transactional
	public boolean qnaDelete(int qnaNo) throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		boolean result = false;
		
		try{
			
			int check = session.delete("qnaDelete", qnaNo);
			
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
