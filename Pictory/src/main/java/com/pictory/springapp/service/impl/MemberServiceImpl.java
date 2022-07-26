package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configurers.userdetails.DaoAuthenticationConfigurer;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService<MemberDTO>{
	@Autowired
	private MemberDAO dao;
	
	@Override
	public String isLogin(Map map) {
	
		return dao.isLogin(map);
	}

	public boolean isExist(String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		System.out.println("@@@@@");
		return dao.isExist(map);
	}
}
