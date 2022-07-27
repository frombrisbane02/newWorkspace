package com.pictory.springapp.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminUsersDTO;


@Repository("adminusersDAO")
public class AdminUsersDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	//- SqlSessionTemplate사용: 위 프로그래밍 순서 가, 나에서는 commit(), 다의 close()호출 불필요
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	//public List<AdminUsersDTO> userList();
	//public int updateEnabled(AdminUsersDTO params);
	//public List<AdminUsersDTO> searchList(AdminUsersDTO keyword);
}