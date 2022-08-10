package com.pictory.springapp.controller.feed;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.FeedArtworkService;
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
	private FeedArtworkService<FeedDTO> artworkService; 
	
		
	@GetMapping("Artwork.do")
	public String galleryList(Model model) {
		
		List<FeedDTO> lists = artworkService.artworkList();
		model.addAttribute("lists",lists);
		
		return "feed/Artwork.tiles";
	}
	
	@PostMapping("Artwork")
	public String galleryList2(Model model) {
		List<FeedDTO> lists = artworkService.artworkList();
		model.addAttribute("lists",lists);
		
		return "feed/Artwork";
		
	}
	
	
	
	
	
	
	
	
}


