package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.pictory.springapp.service.impl.MemberDAO;

public interface MemberService<T> {
	
	
	//로그인 용]
	String isLogin(Map map);
	
	public boolean isExist(String id);
	
}
