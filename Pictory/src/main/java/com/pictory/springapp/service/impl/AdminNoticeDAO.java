package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminNoticeDTO;

@Repository("adminnoticeDAO")
public class AdminNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	// 카운트
	public int getNoticeTotalCount(HashMap<String, Object> params) throws Exception {
		
		int result = template.selectOne("noticeTotalCount", params);
		
		return result;
	}
	
	// 리스트
	public List<AdminNoticeDTO> noticeList(HashMap<String, Object> params) throws Exception {
		
		
		List<AdminNoticeDTO> list = template.selectList("noticeList", params);
		return list;
	}
	
	
	// 저장
	@Transactional
	public boolean noticeInsert(List<HashMap<String, Object>> map) throws Exception {
		
		 boolean result = false;
			
			for(int i = 0; i < map.size(); i++) {
				int list = template.insert("noticeInsert", map.get(i));
				
				if(list == 1) {
					result = true;
				}
			}
			
			return result;
	}
	
	// 업데이트
	@Transactional
	public boolean noticeUpdate(HashMap<String, Object> map) throws Exception {
		 

		boolean result = false;
		int check = template.update("noticeUpdate", map);
		
		if(check == 1) {
			result = true;
		}
		return result;
	}
	
	
	// 삭제
	@Transactional
	public boolean noticeDelete(int map) throws Exception {
		
		
		boolean result = false;
		int check = template.delete("noticeDelete", map);
		
		if(check == 1) {
			result = true;
		}
		
		return result;
		
	}

}
