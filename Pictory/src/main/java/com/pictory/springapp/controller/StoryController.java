package com.pictory.springapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/story/")
public class StoryController {

	
	//종근 - 스토리 컨트롤러
	@RequestMapping("StoryIndex.do")
	public String index() {
		System.out.println("스토리 컨트롤러");
	
		return "story/StoryIndex.tiles";
	}


	@Autowired
	private ObjectMapper mapper;
	
	

	@CrossOrigin
	@RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String virtualrest() throws JsonProcessingException {
		System.out.println("스토리 가상");
	   List<Map<String,String>> lists=new Vector<>();
		for(int i=1;i <= 7 ;i++) {
			System.out.println("이미지 for");
			Map<String,String> map = new HashMap<>();
			map.put("image_url",String.format(" http://192.168.0.27:4040/springapp/images/%d.jpg",i));
			map.put("image_title",String.format("이미지 제목%d",i));
			map.put("image_id",String.format("%s$#@",i));
			lists.add(map);
		}
		System.out.println("이미지 fo끝");
		Map resultMap = new HashMap();
		resultMap.put("preference", null);
		resultMap.put("data", lists);
		
		System.out.println(resultMap.get("preference"));
		System.out.println(resultMap.get("data"));
		
		return mapper.writeValueAsString(resultMap);
	}//
	
}
