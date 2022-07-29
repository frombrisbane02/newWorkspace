package com.pictory.springapp.service.impl;

import java.util.List;

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

	public List<GalleryDTO> selectGalleryList() {
		
		List<GalleryDTO> resultList = template.selectList("galleryList");
		
		for(GalleryDTO oneResult : resultList) {
			System.out.println("결과가 있긴하다네요..");
		}
		return resultList;
	}
}
