package com.pictory.springapp.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;
import com.pictory.springapp.service.impl.PostUploadServiceImpl;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/gallery/")
public class PostController {
	
	@Autowired
	private PostUploadService<PostDTO> postUploadService;
	
	@Autowired
	private MultipartResolver multiPartResolver;
	
	
	@GetMapping("post/Upload1.do")
	public String upload1Page() {
		//업로드 버튼 클릭시 업로드1 페이지로 넘겨주기
		return "gallery/Upload1.tiles";
	}
	
	/*upload1에서 누를시 upload2 페이지로 넘어감*/
	@GetMapping("post/Upload2.do")
	public String upload2Page(@RequestParam Map map, Model model) {
		model.addAttribute("postSellorNot",map.get("sellornot"));
		
		return "gallery/Upload2.tiles";
	}

	//판매용 업로드 처리
	@PostMapping("post/SellUpload.do")
	public String sellUpload(@ModelAttribute("userId") String userId, PostDTO dto, @RequestParam Map map, Model model) {
		System.out.println(map.get("postTitle"));
		System.out.println(map.get("textContent"));
		
		model.addAttribute("postSellorNot",map.get("sellornot"));
		model.addAttribute("postTitle",map.get("postTitle"));
		model.addAttribute("textContent",map.get("textContent"));

		map.put("userId", userId);

		//[서비스호출]
		//postUploadService.postInsert(map);
		
		//articleService.write(dto);
		return "gallery/Index.tiles";
	}
	
	
	
	@PostMapping("post/NotSellUpload.do")
	public String notSellUpload(@ModelAttribute("userId") String userId,@RequestParam Map map, Model model,
			@RequestParam("storyThumbnail") MultipartFile sThumbnail,
			@RequestParam("uploadImage") List<MultipartFile> uploadImage, HttpServletRequest req) throws IllegalStateException, IOException {
		
		//할일: 스토리랑 해시태그 추가하기
		System.out.println("가져온맵: "+map);
		System.out.println("스토리썸네일이름: "+sThumbnail.getOriginalFilename());
		System.out.println("스토리썸네일사이즈: "+sThumbnail.getSize());
		
		//일단 아이디부터 map에 넣고!!
		map.put("userId", userId);
		
		//1) 파일을 디렉토리 만들고 + 업로드하는것까지 하나의 메소드로 먼저 호출
		String path = postUploadService.uploadingFile(map,uploadImage);
		
		//1.1) 만일 스토리를 생성했다면? storyThumnail이 null이 아니면 썸네일부터 업로드처리하기
		String storyThumbnail = null;
		if((sThumbnail.getSize()!=0) && !(sThumbnail.getOriginalFilename().equals(""))) {
			
			storyThumbnail = postUploadService.uploadStoryThumbnail(map,sThumbnail);
			map.put("storyThumbnail", storyThumbnail);
			
			//스토리 먼저 생성해야 넣을 수 있음
			postUploadService.storyInsert(map);
		}
		
		//2) 파일관련 정보를 담은 List를 만들고 List에 담아서 POST 부터 업로드 호출!
		List<Map<String,Object>> fileInfo = new ArrayList<Map<String,Object>>();
		
		//2.1) 파일관련 정보 담은 map에 정보 넣어두기
		for(MultipartFile file : uploadImage) {
			
			Map<String, Object> fileList = new HashMap<String, Object>();
			
			String photoName = file.getOriginalFilename();
			int photoSize = (int)Math.ceil(file.getSize()/1024.0);
			String photoUrl = path+"\\"+photoName;
			
			fileList.put("photoName", photoName);
			fileList.put("photoSize", photoSize);
			fileList.put("photoUrl", photoUrl);
			
			//fileInfo List<Map<String,Object>>에 fileList(Map<String,Object>) 추가하기
			fileInfo.add(fileList);
		}
		
		//======================= 글 저 장 ============================
		System.out.println("map의 Title:"+map.get("postTitle"));
		System.out.println("map의 postText:"+map.get("postText"));
		System.out.println("map의 postCategory:"+map.get("postCategory"));
		System.out.println("map의 postSellorNot:"+map.get("postSellorNot"));
		System.out.println("황인곤의 세션 아이디: "+userId);
		
		
		//============================해시태그랑 스토리 값 받아오자============================
		System.out.println("map의 hashtags"+map.get("hashtags"));
		System.out.println("map의 storyTitle"+map.get("storyTitle"));
		System.out.println("map의 storyDescription"+map.get("storyDescription"));
		
		
		//부모테이블인 post Upload부터 하기(넘길때 본문정보 담긴 map, List 같이 넘기기)
		postUploadService.postInsert(map,fileInfo);
	
		
		
		//[Data 저장]
		//model.addAttribute("record", record);
		
		/*
		System.out.println(map.get("postTitle"));
		System.out.println(map.get("textContent"));
		System.out.println(dto.getPostTitle());
		System.out.println(dto.getPostCategory());
		System.out.println(dto.getPostSellorNot());
		System.out.println(dto.getPostHits());*/
		
		/*
		dto.setPostTitle(map.get("postTitle").toString());
		dto.setPostSellorNot(Integer.parseInt(map.get("postSellorNot").toString()));
		dto.setPostCategory(map.get("postCategory").toString());*/
		
		model.addAttribute("postTitle",map.get("postTitle"));		
		model.addAttribute("postSellorNot",2);
		model.addAttribute("postCategory",map.get("postCategory"));
		
		//model.addAttribute("textContent",map.get("textContent"));
		
	
		//전부 업로드하고 갤러리 목록으로 ㄱㄱ
		return "gallery/Index.tiles";
	}
}