package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.StoryDTO;

@Repository("storyDAO")
public class StoryDAO<T> {

	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<T> virtualList(StoryDTO storyDTO) {
		
		template.selectOne("virtuallist", storyDTO);
		//return template.selectOne("virtuallist", map);
		return null;
		
	}
}
