package com.pictory.rest.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.rest.service.GalleryDTO;

@Service("galleryService")
public class GalleryService {
	
	@Autowired
	private GalleryDAO dao;

	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {		
		return dao.feedGalleryList(dto);
	}
	
	public List<GalleryDTO> galleryList(Map<String, String> map) {		
		return dao.galleryList(map);
	}
	
	public List<GalleryDTO> storyList(GalleryDTO dto) {		
		return dao.storyList(dto);
	}
	
	public List<GalleryDTO> storyPictureList(GalleryDTO dto) {		
		return dao.storyPictureList(dto);
	}
	

}
