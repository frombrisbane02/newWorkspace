package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.GalleryDTO;

@Repository("galleryDAO")
public class GalleryDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;

	
	//상단바-갤러리 클릭시 조회용
	public List<GalleryDTO> selectGalleryList() {
		
		return template.selectList("galleryList");
	}
	

	public List<GalleryDTO> selectPhotoList(int postNo) {
		
		System.out.println("DAO: 클릭한 postNo: "+postNo);
		
		// photoUrl 먼저 뽑아오기
		//List<Map<String, Object>> photoLists = new ArrayList<Map<String,Object>>();
		List<GalleryDTO> photoLists = template.selectList("photoList",postNo);
		
		for(GalleryDTO onePhoto : photoLists) {
			System.out.println("클릭한 post의 url"+onePhoto.getPhotoUrl());
		}
		return photoLists;
		
	}


	public List<GalleryDTO> selectGalleryView(int postNo) {
		System.out.println("dao 클릭한 postNo"+postNo);
		return template.selectList("galleryView",postNo);
	}




}
