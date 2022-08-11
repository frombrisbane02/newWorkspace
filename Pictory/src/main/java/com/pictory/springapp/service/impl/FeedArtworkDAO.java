package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.GalleryDTO;


@Repository("feedArtworkDAO")
public class FeedArtworkDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	String resource = Constants.RESOURCE.toString();
	
	public List<FeedDTO> artworkList() {
		
		return template.selectList("artworkList");
	}
	
	public List<FeedDTO> artworkSelectList() {
		//조회 시 photoUrl은 resource 빠져있으니까 그거 추가로 붙여서 저장해야함
		
		List<FeedDTO> rawLists = template.selectList("artworkList");
		
		
		for(FeedDTO rawList : rawLists) {
			
			rawList.setPhotoUrl(resource+rawList.getPhotoUrl());
			rawList.setUserProfile(resource+rawList.getUserProfile());
		}
		System.out.println("데이터 받아오기 "+rawLists.get(2));
		
		return rawLists;
	}
	
	

	




}
