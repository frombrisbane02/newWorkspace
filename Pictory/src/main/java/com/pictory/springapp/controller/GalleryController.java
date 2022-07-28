package com.pictory.springapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartResolver;

import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/gallery/")
public class GalleryController {
	
	//@Autowired
	//private GalleryService<PostDTO> GalleryUploadService;
	
	@Autowired
	private MultipartResolver multiPartResolver;
	
	
	@GetMapping("GalleryList.do")
	public String upload1Page() {
		//상단바 갤러리 클릭시 여기로 넘기기
		return "gallery/GalleryList.tiles";
	}
	
	
	

}
