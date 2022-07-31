package com.pictory.springapp.controller.feed;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;

@SessionAttributes("userId")
@Controller
@RequestMapping("/feed/")
public class FeedStoryController {

	
	@Autowired
	   private StoryService<StoryDTO> storyService;

	   
	   //종근 - 스토리 컨트롤러
	   @RequestMapping("FeedStory.do")
	   public String index(Model model) {
	      
	      List<StoryDTO> storyList = new ArrayList<StoryDTO>();
	      List<StoryDTO> returnValue = storyService.virtualList();
	      
	      System.out.println("returnValue: "+returnValue.toString());
	      
	      for(StoryDTO storyOne : returnValue) {
	         System.out.println("storyone에 담긴 sNo: "+ storyOne.getSNo());
	         System.out.println("storyone에 담긴 title: "+ storyOne.getStoryTitle());
	         System.out.println("storyone에 담긴 desc: "+ storyOne.getStoryDescription());
	         System.out.println("storyone에 담긴 Thumb: "+ storyOne.getStoryThumbnail());
	         System.out.println("storyone에 담긴 UserId: "+ storyOne.getUserId());
	         System.out.println("storyone에 담긴 Nick: "+ storyOne.getUserNickname());
	      }
	      model.addAttribute("returnValue", returnValue);
	      return "feed/FeedStory.tiles";
	   }
	   
	   
	   
	

	   



}
