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

	
	//상단바-갤러리 클릭시 조회용
	public List<GalleryDTO> selectGalleryList() {
		
		return template.selectList("galleryList");
	}
}
