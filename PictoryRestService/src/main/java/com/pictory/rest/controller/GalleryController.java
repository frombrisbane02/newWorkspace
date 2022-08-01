package com.pictory.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@CrossOrigin
	@PostMapping("/galley/feedGalleryList")
	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {
		return galleryService.feedGalleryList(dto);
	}
	
	//작품 태그 리스트
	@CrossOrigin
	@PostMapping("/galley/galleryList")
	public List<GalleryDTO> galleryList(@RequestParam Map<String, String> map) {		
		System.out.println("postCategory:"+map.get("postCategory"));
		System.out.println("orderCode:"+map.get("orderCode"));
		return galleryService.galleryList(map);
	}
	
	@CrossOrigin
	@PostMapping("/galley/storyList")
	public List<GalleryDTO> storyList(GalleryDTO dto) {
		System.out.println("userNo:"+dto.getUserNo());
		return galleryService.storyList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/storyPictureList")
	public List<GalleryDTO> storyPictureList(GalleryDTO dto) {
		System.out.println("sNo:"+dto.getSNo());
		
		return galleryService.storyPictureList(dto);
	}
	
	@CrossOrigin
	@GetMapping(value="/galley/museum")
	public Map<String,List<Map<String,String>>> museum(@RequestParam String sNo) {
		System.out.println("sNo:"+sNo);
		GalleryDTO dto = new GalleryDTO();
		dto.setSNo(sNo);		
		List<Map<String,String>> lists=new Vector<>();
		List<GalleryDTO> photos = galleryService.storyPictureList(dto);
		
		for(GalleryDTO photo:photos) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url",photo.getPhotoUrl());
			map.put("image_title",photo.getPhotoName());
			map.put("image_id",photo.getPhotoNo());
			lists.add(map);
		}
		
		/*
		for(int i=1;i <= 35 ;i++) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url",String.format("http://192.168.0.25:9191/springapp/images/%d.jpg",i));
			map.put("image_title",String.format("이미지 제목%d",i));
			map.put("image_id",String.format("%s$#@",i));
			lists.add(map);
		}
		Map resultMap = new HashMap();
		resultMap.put("preference", null);
		resultMap.put("data", lists);
	
		return mapper.writeValueAsString(resultMap);	*/
		Map<String,List<Map<String,String>>> map = new HashMap<>();
		map.put("data", lists);
		return map;
	}/////////////////
	
	
}
