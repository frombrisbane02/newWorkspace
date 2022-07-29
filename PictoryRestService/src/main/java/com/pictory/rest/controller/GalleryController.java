package com.pictory.rest.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.pictory.rest.service.GalleryDTO;
import com.pictory.rest.service.impl.GalleryService;

@RestControllerAdvice
@RestController
public class GalleryController {
	
	@Autowired(required = false)
	private GalleryService galleryService;
	
	
	@PostMapping("/galley/feedGalleryList")
	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {
		return galleryService.feedGalleryList(dto);
	}
	
}
