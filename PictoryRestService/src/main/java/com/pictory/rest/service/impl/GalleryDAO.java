package com.pictory.rest.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.rest.service.GalleryDTO;

@Repository
public class GalleryDAO {
	
	
	@Autowired
	private SqlSessionTemplate template;

	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {
		return template.selectList("feedGalleryList",dto);
	}
	

}
