package com.pictory.springapp.service.impl;

import java.util.HashMap;
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
	public List<AdminGalleryDTO> gelleryChart(List<HashMap<String, Object>> param) throws Exception {
		
		try {
			List<AdminGalleryDTO> list = galleryDAO.galleryChart(param);
			
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return null;
	}




	
	
	
}




	
	
	

