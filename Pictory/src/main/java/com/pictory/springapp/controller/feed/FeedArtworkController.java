package com.pictory.springapp.controller.feed;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pictory.springapp.dto.FeedDTO;

@Controller
@RequestMapping("/feed/")
public class FeedArtworkController {

	
	
		
		
		@RequestMapping("Artwork.do")
		public String artwork(HttpSession session, Model model) {
			System.out.println("아트워크 되나?");
			
			String id = (String) session.getAttribute("userId");

			
			return "feed/Artwork.tiles";
		}

	}

