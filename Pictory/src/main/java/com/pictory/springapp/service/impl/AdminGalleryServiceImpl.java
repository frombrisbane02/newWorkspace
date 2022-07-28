package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminGalleryService;

@Service
public class AdminGalleryServiceImpl implements AdminGalleryService {
	
	@Autowired
	private AdminGalleryDAO galleryDAO;

	@Override
	public List<AdminGalleryDTO> galleryList(AdminGalleryDTO param) throws Exception {
		try {
			List<AdminGalleryDTO> galleryList = galleryDAO.selectList(param);
			return galleryList;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}




	
	
	
}
