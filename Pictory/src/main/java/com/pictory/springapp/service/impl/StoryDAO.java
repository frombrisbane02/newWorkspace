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
	
	public List<StoryDTO> virtualList() {
		
		System.out.println("dao까지는...왔니?");
		
		return template.selectList("virtuallist");
		
	}

	public List<StoryDTO> virtualImages(List<StoryDTO> returnValue) {
		
		//dto에 같이 넘어오는값: sNo, 썸네일, storyTitle, Description
		//SELECT photoURL FROM PHOTO WHERE sNo=?인 postNo를 모두 찾고, 그 다음에 photourl싹 긁어오기
		//1) sNo 정보로 postNo 다 가져오기
		//sNo:getPostNo() - 1,3,5
		
		
		//2) postNo 들어간 photoUrl 다 가져오기
		
		
		return template.selectList("virtualImages");
	}
}
