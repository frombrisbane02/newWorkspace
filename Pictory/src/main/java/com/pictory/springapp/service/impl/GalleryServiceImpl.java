package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService<GalleryDTO> {
	
	@Autowired
	private GalleryDAO dao;

	@Override
	public List<GalleryDTO> galleryList() {
		
		List<GalleryDTO> resultList =dao.selectGalleryList();
		
		for(GalleryDTO oneResult: resultList) {
			System.out.println("카테고리 :"+oneResult.getPostCategory());
			System.out.println("카테고리 :"+oneResult.getPostCategory());
			System.out.println("카테고리 :"+oneResult.getPostLikes());
			System.out.println("카테고리 :"+oneResult.getPostNo());
			System.out.println("카테고리 :"+oneResult.getUserId());
			System.out.println("카테고리 :"+oneResult.getUserName());
			
		}
		return null;
	}

}
