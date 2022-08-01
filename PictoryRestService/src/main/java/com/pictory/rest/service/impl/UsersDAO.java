package com.pictory.rest.service.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.rest.service.UsersDTO;

@Repository
public class UsersDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public boolean isJoin(Map<String, String> map) {
		return (Integer)template.selectOne("UsersIsJoin",map)==1?true:false;
	}
	
	public UsersDTO selectOne(Map<String, String> map) {
		return template.selectOne("selectOneUser",map);
	}
	
	public int insertUsers(Map<String, String> map) {
		template.insert("usersInsert",map);
		return template.insert("authoritiesInsert");
	}



	
	
}
