package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.StoryDTO;

@Repository("feedDAO")
public class FeedDAO {

	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public List<FeedDTO> replyselect(int userNo){
		
		List<FeedDTO> tmp = template.selectList("replyselect", userNo);
		
		return tmp;
	}

	
	
	
		   
	public FeedDTO feedInfo (String id) {
		SqlSession session= sqlMapper.openSession();
		FeedDTO dto = session.selectOne("feedInfo", id);
		return dto;
	}







	







	







	
}

