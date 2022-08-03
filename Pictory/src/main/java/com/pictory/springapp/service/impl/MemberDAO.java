package com.pictory.springapp.service.impl;

import java.io.IOError;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import javax.xml.transform.Templates;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.SavePostDTO;

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
		System.out.println("@@@@@@@isLogin@@@@@@:"+map);
		return template.selectOne("memberIsLogin", map);
	}
	
	
	public boolean isExist(Map map) {
		System.out.println("@@@@@@isExist:"+map);
		int count = template.selectOne("memberCheck", map);
		return count == 1;
	}
	
	public int signUp(MemberDTO dto) {
		System.out.println("회원가입dao:"+dto);
		int succ=0;
		try {
		succ=template.insert("memberInsert",dto);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return succ;
	}
	public int kakaosignUp(Map<String, Object> userInfo) {
		System.out.println("회원가입userInfo:"+userInfo);
		int succ=0;
		try {
		succ=template.insert("kakaoInsert",userInfo);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return succ;
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
	

	
	public MemberDTO readMember(String id) {
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
	
	public List<SavePostDTO> selectLikePost(int userNo) {
		List<SavePostDTO> dto = template.selectList("selectLikePost", userNo);
		return dto;
	}
	
	public List<SavePostDTO> selectBuyPost(int userNo) {
		List<SavePostDTO> dto = template.selectList("selectBuyPost", userNo);
		return dto;
	}
	
	public PostDTO selectPost(int postNo ) {
		PostDTO dto = template.selectOne("selectPost", postNo);
		return dto;
	}
	
	public MemberDTO selectMember(int userNo) {
		MemberDTO dto = template.selectOne("selectMember", userNo);
		return dto;
	}

		
}
