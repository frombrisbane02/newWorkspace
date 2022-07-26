package com.pictory.springapp.service.impl;

import java.io.IOError;
import java.io.IOException;
import java.io.Reader;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
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
	
	@Autowired
	private SqlSessionTemplate template;

	public String isLogin(Map map) {
		System.out.println("@@@@@@@isLogin@@@@@@MAP:"+map);
		return template.selectOne("memberIsLogin", map);
	}
	
	
	public boolean isExist(Map map) {
		System.out.println("@@@@@@isExist:"+map);
		int count = template.selectOne("memberCheck", map);
		return count == 1;
	}
	/*
	public boolean isLogin(Map map) {
		System.out.println("@@MemberDAO_isLogin@@");
		SqlSession session= sqlMapper.openSession();
		int count= session.selectOne("memberIsLogin", map);
		System.out.println("map:"+map);
		System.out.println("count:"+count);
		System.out.println("session:"+session);
		session.close();
		return count==1 ? true:false;
	}*/

		
}
