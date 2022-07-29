package com.pictory.springapp.controller;

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
import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;

import lombok.AllArgsConstructor;

@SessionAttributes("userId")
@Controller
@RequestMapping("/story/")
public class StoryController {
	
	@Autowired
	private StoryService<StoryDTO> storyService;

	
	//종근 - 스토리 컨트롤러
	@RequestMapping("StoryIndex.do")
	public String index(Model model) {
		
		List<StoryDTO> storyList = new ArrayList<StoryDTO>();
		//Map<StoryDTO> storyList = new Map<StoryDTO>();
		
		//selectList 쿼리가 들어있는 서비스 호출하기
		//storyService.virtualList(storyList);
		List<StoryDTO> returnValue = storyService.virtualList();
		
		System.out.println("returnValue: "+returnValue);
		
		for(StoryDTO storyOne : returnValue) {
			System.out.println("storyone에 담긴 sNo: "+ storyOne.getSNo());
			System.out.println("storyone에 담긴 title: "+ storyOne.getStoryTitle());
			System.out.println("storyone에 담긴 desc: "+ storyOne.getStoryDescription());
			System.out.println("storyone에 담긴 Thumb: "+ storyOne.getStoryThumbnail());
			
			System.out.println("storyone에 담긴 UserId: "+ storyOne.getUserId());
			System.out.println("storyone에 담긴 Nick: "+ storyOne.getUserNickname());
		}
		model.addAttribute("returnValue", returnValue);
		return "story/StoryIndex.tiles";
	}
	
	
	
	   @RequestMapping("virtualprocess.do")
	   public String virtualprocess(Model model) {
	      
		   
		   System.out.println("virtual프로세서 프로세서");
//	      List<StoryDTO> images = storyService.virtualImages();
//	      model.addAttribute("virtualImage", images);
//	      System.out.println("이미지가 들어올려나???"+images.toArray().toString());
		   
			List<StoryDTO> storyimages = storyService.virtualImages();
			System.out.println("1111111111111 ");

			System.out.println("storyimages: "+storyimages);
			System.out.println("222222222222 ");

			

	      
	      return "story/Virtual.tiles";
	   }

	@Autowired
	private ObjectMapper mapper;
	
	
	/*
	@CrossOrigin
	@RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String virtualrest() throws JsonProcessingException {
	   List<Map<String,String>> lists=new Vector<>();
		for(int i=1;i <= 7 ;i++) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url",String.format(" http://192.168.0.27:4040/springapp/images/%d.jpg",i));
			map.put("image_title",String.format("이미지 제목%d",i));
			map.put("image_id",String.format("%s$#@",i));
			lists.add(map);
		}
		System.out.println("이미지 for문 끝");
		Map resultMap = new HashMap();
		resultMap.put("preference", null);
		resultMap.put("data", lists);
		
		System.out.println(resultMap.get("preference"));
		System.out.println(resultMap.get("data"));
		
		return mapper.writeValueAsString(resultMap);
	}//
	*/
	

	@CrossOrigin
	@RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String virtualrest() throws JsonProcessingException {
		System.out.println("스토리 가상");
	   List<Map<String,String>> lists=new Vector<>();
		for(int i=1;i <= 7 ;i++) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url",String.format(" http://192.168.0.27:4040/springapp/images/%d.jpg",i));
			map.put("image_title",String.format("이미지 제목%d",i));
			map.put("image_id",String.format("%s$#@",i));
			lists.add(map);
		}
		System.out.println("이미지 for문 끝");
		Map resultMap = new HashMap();
		resultMap.put("preference", null);
		resultMap.put("data", lists);
		
		System.out.println(resultMap.get("preference"));
		System.out.println(resultMap.get("data"));
		
		return mapper.writeValueAsString(resultMap);
	}//
	
}
