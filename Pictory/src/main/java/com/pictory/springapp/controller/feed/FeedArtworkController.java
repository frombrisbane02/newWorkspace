package com.pictory.springapp.controller.feed;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedService;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.service.impl.FeedServiceImpl;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/feed/")
public class FeedArtworkController {

	@Autowired
	private GalleryService<GalleryDTO> gallerService; 
	
		
		
	@GetMapping("Artwork.do")
	public String artwork(Model model) {
		//상단바 갤러리 클릭시 List에 뿌려줄 정보 저장해서 뿌리기
		
		System.out.println("아트워크 들어오셨어요?;;");
		List<GalleryDTO> lists = gallerService.galleryList();
		
		for(GalleryDTO list : lists) {
			System.out.println("Controller- postTitle:" + list.getPostTitle());
			System.out.println("Controller - userNickname: "+list.getUserNickname());
			System.out.println("Controller - Likes: "+list.getPostLikes());
			System.out.println("Controller - UserProfile: "+list.getUserProfile());
			
		}
		
		model.addAttribute("lists",lists);
		
		
		return "feed/Artwork.tiles";
	}
}


