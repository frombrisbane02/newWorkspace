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

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedStoryService;


	

@SessionAttributes("userId")
@Controller

public class FeedStoryController {

	
	@Autowired
	private FeedStoryService<FeedDTO> feedStoryService;

	   
	   
	@RequestMapping("/feed/FeedStory.do")
	   public String index(HttpSession session , Model model) {
	     String id = (String) session.getAttribute("userId");
	      List<FeedDTO> returnValue = feedStoryService.virtualList();
	      
	      model.addAttribute("returnValue", returnValue);
	      return "feed/FeedStory";
	   }
	   
	   
	   
	   @RequestMapping("virtualprocess.do")
	   public String virtualprocess(@RequestParam int sNo,Model model,HttpSession req) {
	      
	      model.addAttribute("sNo", sNo);
	      return "story/Virtual.tiles";
	   }



	   @Autowired
	   private ObjectMapper mapper;
	   
	   
	   
	   @CrossOrigin
	   @RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
	   public @ResponseBody String virtualrest(HttpServletRequest req) throws JsonProcessingException {
	      
	      List<Map<String,String>> lists=new Vector<>();
	     
	      List<FeedDTO> feedstoryimages = feedStoryService.virtualImages(Integer.parseInt(req.getParameter("sNo")));
	      for(FeedDTO dto:feedstoryimages) {
	    	 Map<String,String> map = new HashMap<>();
	    	 map.put("image_url", dto.getPhotoUrl());
	         //map.put("image_title",String.format("이미지 제목%d",dto.getPhotoName()));
	    	 map.put("image_title","");
	         map.put("image_id",String.format("%sID",dto.getPhotoNo()));
	    	 lists.add(map);
	      }
	      Map resultMap = new HashMap();
	      resultMap.put("data",lists);
	      resultMap.put("preference", null);
	 
	      resultMap.get("preference");
	      resultMap.get("data");
	      
	      
	      return mapper.writeValueAsString(resultMap);
	   }//


}
