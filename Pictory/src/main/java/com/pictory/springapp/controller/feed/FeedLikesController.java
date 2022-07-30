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
public class FeedLikesController {

	
	
		
		
	@RequestMapping("Likes.do")
	public String alert() {
		System.out.println("좋아요 페이지 되나요?");
		
		return "feed/Likes.tiles";
	}
	}