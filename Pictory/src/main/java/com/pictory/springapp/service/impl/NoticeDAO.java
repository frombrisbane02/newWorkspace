package com.pictory.springapp.service.impl;

import java.io.IOError;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.NoticeDTO;
import com.pictory.springapp.dto.SearchDTO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;

	
	public boolean isLogin(Map map) {
		//스프링 지원 마이바티스 API(SqlSessionTemplate) 미 사용시
		//1]SqlSession얻기
		SqlSession session=sqlMapper.openSession();
		//2]selectOne()호출
		int count=session.selectOne("noticeIsLogin", map);
		//3]close()호출
		session.close();
		return count==1 ? true : false;
	}

	public List<NoticeDTO> noticeSelectList(Map map) {
		return template.selectList("noticeSelectList", map);
	}

	public int insert(Map map) {
		//스프링 지원 마이바티스 API(SqlSessionTemplate) 미 사용시
		//1]SqlSession얻기
		SqlSession session=sqlMapper.openSession();
		//2]insert()호출
		int affected=session.insert("noticeInsert", map);
		//3]commit()호출
		session.commit();
		//4]close()호출
		session.close();
		return affected;
	}
	
	public NoticeDTO selectOne(Map map) {		
		
		return template.selectOne("noticeSelectOne", map);
	}

	public int update(Map map) {		
		return template.update("noticeUpdate",map);
	}

	public int delete(Map map) {
		return template.delete("noticeDelete",map);		
	}
	
	public int getTotalRecordCount(Map map) {
		return template.selectOne("noticeTotalRecordCount", map);
	}

		
}
