package com.pictory.springapp.service.impl;

import java.io.IOError;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.MemberDTO;

@Repository
public class MemberDAO {
	/*
	private static SqlSessionFactory sqlMapper;
	static {
		try {
		String resource = "mybatis/configuration.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		sqlMapper = new SqlSessionFactoryBuilder().build(reader);
		}
		catch(IOException e) {e.printStackTrace();}
		
	}*/
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	
	public boolean isLogin(Map map) {
		System.out.println("@@MemberDAO_isLogin@@");
		SqlSession session= sqlMapper.openSession();
		int count= session.selectOne("memberIsLogin", map);
		System.out.println("map:"+map);
		session.close();
		return count==1 ? true:false;
	}


	public MemberDTO readMember(String id) {
		// TODO Auto-generated method stub
		SqlSession session= sqlMapper.openSession();
		MemberDTO memberDTO = session.selectOne("readMember", id);
		return memberDTO;
	}


	public void updateMember(MemberDTO dto) {
		SqlSession session= sqlMapper.openSession();
		session.update("updateMember", dto);
	}
	
	public void updateMemberPassword(MemberDTO dto) {

		SqlSession session= sqlMapper.openSession();
		session.update("updateMemberPassword", dto);
	}
		
}
