package com.pictory.springapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartResolver;

import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/gallery/")
public class GalleryController {
	
	@Autowired
	private GalleryService<GalleryDTO> galleryService;
	
	@GetMapping("GalleryList.do")
	public String upload1Page(Model model) {
		//상단바 갤러리 클릭시 List에 뿌려줄 정보 저장해서 뿌리기
		
		System.out.println("갤러리컨트롤러 들어오셨어요?;;");
		List<GalleryDTO> lists = galleryService.galleryList();
		
		for(GalleryDTO list : lists) {
			System.out.println("Controller- postTitle:" + list.getPostTitle());
			System.out.println("Controller - userNickname: "+list.getUserNickname());
			System.out.println("Controller - Likes: "+list.getPostLikes());
			System.out.println("Controller - UserProfile: "+list.getUserProfile());
			
		}
		
		model.addAttribute("lists",lists);
		
		
		return "gallery/GalleryList.tiles";
	}
}
