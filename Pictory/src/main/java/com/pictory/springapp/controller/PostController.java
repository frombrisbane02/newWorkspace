package com.pictory.springapp.controller;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
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
import com.pictory.springapp.dto.MemberDTO;
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
		return "gallery/Upload1.tiles";
	}
	
	@GetMapping("post/Upload2.do")
	public String upload2Page(@RequestParam Map map, Model model, @ModelAttribute("userId") String userId) {
		model.addAttribute("postSellorNot",map.get("sellornot"));
		List<PostDTO> storyLists = postUploadService.selectStoryList(userId);
		model.addAttribute("storyLists",storyLists);
		
		return "gallery/Upload2.tiles";
	}
	
	@PostMapping("post/SellUpload.do")
	public String sellUpload(@ModelAttribute("userId") String userId, @RequestParam Map map,
			@RequestParam(value="hashtags") List<String> hashtag,
			@RequestParam("uploadImage") MultipartFile uploadImage, HttpServletRequest req) {
		
		//1) 일단 map에 userId 저장
		map.put("userId", userId);
		
		//2) 파일 디렉토리 생성 + 업로드
		String path = req.getSession().getServletContext().getRealPath("/upload");
		map.put("path", path);
		path = postUploadService.uploadoneFile(map,uploadImage);
		
		//3)post, photo, product insert
		String photoName = uploadImage.getOriginalFilename();
		int photoSize = (int)Math.ceil(uploadImage.getSize()/1024.0);
		String photoUrl = String.valueOf(map.get("userId"))+"/"+photoName;
		
		//파일 정보 저장
		map.put("photoName", photoName);
		map.put("photoSize", photoSize);
		map.put("photoUrl", photoUrl);
		
		//파일 업로드 서비스 호출
		postUploadService.sellPostInsert(map);
		
		return "forward:/gallery/GalleryList.do";
	}
	
	
	@PostMapping("post/NotSellUpload.do")
	public String notSellUpload(@ModelAttribute("userId") String userId,@RequestParam Map map,
			@RequestParam("storyThumbnail") MultipartFile sThumbnail,
			@RequestParam(value="hashtags") List<String> hashtag,
			@RequestParam("uploadImage") List<MultipartFile> uploadImage, HttpServletRequest req) throws IllegalStateException, IOException {

		
		//0.1) 아이디 저장
		map.put("userId", userId);
		
		//0.2) 지도 첨부했는지 체크하여 첨부시 저장
		if(map.get("alat")!=null && !map.get("alat").toString().equals("")) {
			String markerLocation = map.get("alat")+","+map.get("alng");
			map.put("markerLocation", markerLocation);
		}
		
		//1) 파일 디렉토리 생성 + 업로드 호출
		String path = req.getSession().getServletContext().getRealPath("/upload");
		map.put("path", path);
		path = postUploadService.uploadingFile(map,uploadImage);
		
		//1.1) 스토리를 생성한 경우 - 썸네일부터 업로드처리
		String storyThumbnail = null;
		if((sThumbnail.getSize()!=0) && !(sThumbnail.getOriginalFilename().equals(""))) {
			
			storyThumbnail = postUploadService.uploadStoryThumbnail(map,sThumbnail);
			map.put("storyThumbnail", storyThumbnail);
			
			//스토리 먼저 생성해야 넣을 수 있음
			postUploadService.storyInsert(map);
		}
		
		
		//1.2) 기존 스토리를 선택한 경우 - 해당 sno 참조하여 post, photo 업데이트
		if((map.get("existingstory")!=null)&&!(map.get("existingstory").equals(""))) {
			
			int sNo = Integer.parseInt(map.get("existingstory").toString().substring(5));
			map.put("sNo", sNo);
			
		}
		
		//2) 파일관련 정보를 담은 List
		List<Map<String,Object>> fileInfo = new ArrayList<Map<String,Object>>();
		
		//2.1) 파일관련 정보 담은 map에 정보 저장
		for(MultipartFile file : uploadImage) {
			
			Map<String, Object> fileList = new HashMap<String, Object>();
			
			String photoName = file.getOriginalFilename();
			int photoSize = (int)Math.ceil(file.getSize()/1024.0);
			String photoUrl = String.valueOf(map.get("userId"))+"/"+photoName;
			
			fileList.put("photoName", photoName);
			fileList.put("photoSize", photoSize);
			fileList.put("photoUrl", photoUrl);
			fileInfo.add(fileList);
		}
		
		//post Upload 서비스 호출
		postUploadService.postInsert(map,fileInfo);
	
		//업로드 완료 후 갤러리리스트로 이동
		return "forward:/gallery/GalleryList.do";
	}
}