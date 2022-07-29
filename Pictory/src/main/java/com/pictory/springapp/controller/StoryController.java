package com.pictory.springapp.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;


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
			System.out.println("storyone에 담긴 desc: "+ storyOne.getStoryThumbnail());

		}
		

		
		model.addAttribute("returnValue", returnValue);
		
		return "story/StoryIndex.tiles";
	}
	
	
	
	@RequestMapping("virtualprocess.do")
	public String virtualprocess() {
		
		//username으로 sNo 호출해오는 쿼리 든 서비스 호출
		
		System.out.println("버츄얼 프로세서");
		System.out.println("들어왔습니다 버츄얼 어쩌구 저쩌구");
		
		//여기서 한 스토리의 모든 사진 URL 가져오기!
		//storyService.virtualImages();
	
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
	   List<Map<String,String>> virtualImages=new Vector<>();
		for(int i=1;i <= 7 ;i++) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url","D:\\YJG\\newWorkspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Pictory\\upload\\img\\CHOI2.jpg");
			
			virtualImages.add(map);
		}
		System.out.println("이미지 for문 끝");
		Map resultMap = new HashMap();
		resultMap.put("preference", null);
		resultMap.put("data", virtualImages);
		
		System.out.println(resultMap.get("preference"));
		System.out.println(resultMap.get("data"));
		
		return mapper.writeValueAsString(resultMap);
	}//
	
}
