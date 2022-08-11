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
	private SqlSessionTemplate template;
	
	
	public List<FeedDTO> replyselect(int userNo){
		return template.selectList("replyselect", userNo);
	}
		   
	public FeedDTO feedInfo (String id) {
		return template.selectOne("feedInfo",id);
	}



	public FeedDTO feedInfoOther(int userNo) {
		return template.selectOne("feedInfoOther", userNo);
	}







	







	







	
}

