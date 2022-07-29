package com.pictory.rest.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.rest.service.UsersDTO;

@Service("loginService")
public class LoginService {

	@Autowired
	private UsersDAO dao;

	public Map<String, String> login(UsersDTO inputDto) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", inputDto.getUserId());
		map.put("userPassword", inputDto.getUserPassword());		
		boolean isJoin=dao.isJoin(map);	
		
		if(isJoin) {//회원
			System.out.println("회원");
			UsersDTO dto = dao.selectOne(map);
			map.put("userNo", dto.getUserNo());
			map.put("userId", dto.getUserId());
			map.put("userPassword", dto.getUserPassword());
			map.put("userNickname", dto.getUserNickname());
			map.put("userProfile", dto.getUserProfile());
			map.put("isLogin", String.valueOf(isJoin));
		}else {//비회원
			System.out.println("비회원");
			map.put("isLogin", String.valueOf(isJoin));
		}		
		return map;
	}
	
	public Map<String, String> kakaoLogin(Map<String, String> map) {
		boolean isJoin=dao.isJoin(map);
		UsersDTO dto = new UsersDTO();
		
		if(isJoin) {//회원
			System.out.println("회원");
			dto = dao.selectOne(map);
		}else {//비회원
			System.out.println("비회원");
			int newUser = dao.insertUsers(map);
			if(newUser > 0) {
				dto = dao.selectOne(map);
			}			
		}
		map.put("userNo", dto.getUserNo());
		map.put("userId", dto.getUserId());
		map.put("userPassword", dto.getUserPassword());
		map.put("userNickname", dto.getUserNickname());
		map.put("userProfile", dto.getUserProfile());
		
		return map;
	}
	
	
	
}
