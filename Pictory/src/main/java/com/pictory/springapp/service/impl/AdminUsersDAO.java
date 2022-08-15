package com.pictory.springapp.service.impl;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminUsersDTO;


@Repository("adminusersDAO")
public class AdminUsersDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	// 회원 전체 갯수
	public int usersCount() throws Exception {
	
			
			return template.selectOne("usersCount");
		
	}
	
	
	// 회원 검색 조회
	public int searchUsersCount(HashMap<String, Object> params) throws Exception {
		
			
			String keyword = (String) params.get("keyword");
						
			int result = template.selectOne("searchCount", keyword);
			return result;
	
	}
	
	// 회원 전체 조회
	public List<AdminUsersDTO> userList(HashMap<String, Object> params) throws Exception {
		
		
			List<AdminUsersDTO> list = template.selectList("userList", params);
	        return list;

		
	}
	
	// 로그인한 회원정보
	public List<AdminUsersDTO> readMember(String id) throws Exception {
		
		
			
			List<AdminUsersDTO> result = template.selectList("readUser", id);
			
			return result;
		
	}
	
	// 회원 검색
	public List<AdminUsersDTO> searchList(HashMap<String, Object> params)throws Exception {
		
			
			String keyword = (String) params.get("keyword");
			
			List<AdminUsersDTO> list = template.selectList("searchList", params);
			
			return list;
			
		
		
	}
	
	public int updateEnabled(HashMap<String, Object> params) throws Exception{
		
		
	
			return template.update("updateEnabled", params);
	
	}
	
	
	public List<AdminUsersDTO> userChart(List<HashMap<String, Object>> params) throws Exception {
			
	
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminUsersDTO> list = template.selectList("userChart", map);
			return list;
			
		
	}

}
