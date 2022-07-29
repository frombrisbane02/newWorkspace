package com.pictory.rest.service.impl;

import java.util.List;
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

}
