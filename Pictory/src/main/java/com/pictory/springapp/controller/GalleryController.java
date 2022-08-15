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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.dto.LikeDTO;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/gallery/")
public class GalleryController {
	
	@Autowired
	private GalleryService<GalleryDTO> galleryService;
	
	@Autowired
	ObjectMapper objectMapper;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	
	
	@GetMapping("GalleryList.do")
	public String galleryList(Model model, @ModelAttribute("userId") String userId) {
		//상단바 갤러리 클릭시 List에 뿌려줄 정보 저장해서 뿌리기
		
		List<GalleryDTO> lists = galleryService.galleryList(userId);
		List<GalleryDTO> hashs = galleryService.hashList();
		
		model.addAttribute("lists",lists);
		List postNum = galleryService.findUserPostno(userId);
		model.addAttribute("hashs",hashs);
		model.addAttribute("userId", userId);
		model.addAttribute("postlists", postNum);
		return "gallery/GalleryList.tiles";
	}
	
	@PostMapping("GalleryList")
	public String galleryList2(Model model, @ModelAttribute("userId") String userId) {
		List<GalleryDTO> lists = galleryService.galleryList(userId);
		model.addAttribute("lists",lists);
		
		return "gallery/GalleryList.tiles";
		
	}
	@ResponseBody
	@GetMapping("bbs/Delete.do")
	public String GalleryDelete(@RequestParam("postNo") int postNo) {
		galleryService.postDelete(postNo);
		
		return "GalleryList.do";
	}
	
	
	@GetMapping("GalleryView.do")
	public String GalleryView(Model model,@RequestParam("postNo") int postNo, @ModelAttribute("userId") String userId, Map map) {
		
		Map postMap = new HashMap<>();
		postMap.put("postNo", postNo);
		postMap.put("userId", userId);
		
		//1. photoUrl 먼저 가져오기
		List<GalleryDTO> photoLists = galleryService.galleryPhoto(postNo);
		for(GalleryDTO photoUrls : photoLists) {
			//상수로 ip 주소 붙이기
			photoUrls.setPhotoUrl(resource+photoUrls.getPhotoUrl());
		}
		
		//2. 나머지 본문 정보 추출
		List<GalleryDTO> viewLists = galleryService.galleryView(postNo);
		
		for(GalleryDTO viewList : viewLists) {
			switch(viewList.getPostCategory()) {
			case "landscape": viewList.setPostCategory("풍경"); break;
			case "object": viewList.setPostCategory("정물"); break;
			case "figure": viewList.setPostCategory("인물"); break;
			default: viewList.setPostCategory("기타"); break;
			}	
		}
		
		//3. 작가의 다른 정보 위해 각 포스트 몇개인지 총합, 각 포스트 썸네일, 포스트 no 가져와야함
		List<GalleryDTO> infoLists = galleryService.galleryInfo(postNo);
		GalleryDTO createrInfo = infoLists.get(0);
		System.out.println("view 들어갈때 한번만 찍어보자 진짜 마지막: "+ createrInfo);
		model.addAttribute("createrProfile",createrInfo.getUserProfile());
		model.addAttribute("createrNickname",createrInfo.getUserNickname());
		model.addAttribute("createrPostCount",createrInfo.getPostCount());
		model.addAttribute("createrUserNo",createrInfo.getUserNo());
		
		//4. 수정 삭제용 세션 아이디 저장
		model.addAttribute("userId",map.get("userId"));
		
		//5. 댓글 코멘트 갖고 오기(postNo 넘기고!)
		List<GalleryDTO> comments = galleryService.getComments(postNo);
		
		//6. 판매하는 경우 상품 정보 가져오기
		int isSellorNot = galleryService.isSellorNot(postNo);
		if(isSellorNot==1) {
			model.addAttribute("isSellorNot",isSellorNot);
			GalleryDTO product = galleryService.getProductInfo(postNo);
			model.addAttribute("product", product);
			model.addAttribute("pdNo",product.getPdNo());
			model.addAttribute("photoNo",product.getPhotoNo());
			model.addAttribute("pdPrice",product.getPdPrice());
			model.addAttribute("pdSalesNo",product.getPdSalesNo());
			model.addAttribute("pdDate",product.getPdDate());
			
			//카트정보 저장해 뿌리기
			map.put("userId", userId);
			map.put("postNo", postNo);
			int isAdded = galleryService.findCart(map);
			
			model.addAttribute("isCart",isAdded);
		}
		
		
		
		//7. MAP 첨부했는지 체크해서 가져오기
		int isMapAttached = galleryService.isMapAttached(postNo);
		
		if(isMapAttached==1) {
			GalleryDTO mapInfo = galleryService.getMapInfo(postNo);
			String markerLocation = mapInfo.getMarkerLocation();
			String lat=markerLocation.split(",")[0];
			String lng=markerLocation.split(",")[1];
			
			model.addAttribute("lat",lat);
			model.addAttribute("lng",lng);
		}
		
		//8. 로그인 한 사람 정보 다 갖고오기
		GalleryDTO loginUser = galleryService.getLoginInfo(userId);
		model.addAttribute("loginUser",loginUser);
		
		//8. Model에 정보 저장 후 돌아가기
		model.addAttribute("postNo",postNo);
		model.addAttribute("comments",comments);
		model.addAttribute("photoUrls",photoLists);
		model.addAttribute("viewLists",viewLists);
		//model.addAttribute("infoLists", infoLists);
		//model.addAttribute("otherWorks",infoLists.get(0).getPostCount());
		//model.addAttribute("postLikes",infoLists.get(0).getPostLikes());
		model.addAttribute("loginUserProfile",loginUser.getUserProfile());
		
		System.out.println("loginUserProfile:로그인한애 프로필 ㅇㅇ"+loginUser.getUserProfile());
		model.addAttribute("userProfile",viewLists.get(0).getUserProfile());
		model.addAttribute("userNickname",viewLists.get(0).getUserNickname());
		model.addAttribute("postLikes",viewLists.get(0).getPostLikes());
		model.addAttribute("postHits",viewLists.get(0).getPostHits());
		model.addAttribute("postSellorNot",viewLists.get(0).getPostSellorNot());
		model.addAttribute("postTitle",viewLists.get(0).getPostTitle());
		
		
		return "gallery/GalleryView.tiles";
	}
	
	@CrossOrigin
	@RequestMapping(value="post/SubmitComment.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String comment(@RequestParam String cText, @RequestParam String userId, 
									@RequestParam int postNo ,HttpSession session, Model model,
									HttpServletRequest req) throws JsonProcessingException{
		
		//댓글 저장(commentarea 자르고 저장)
		String realComment = cText.substring(12);
		
		//DB저장
		Map map = new HashMap();
		map.put("postNo", postNo);
		map.put("userId", userId);
		map.put("cText", realComment);
		
		//댓글 insert
		galleryService.galleryComment(map);
	
		return "{\"comment\":\"sucsses\"}";
	}


	   @CrossOrigin
	   @RequestMapping(value="post/Likes.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody 
	   public int likes(@RequestParam(value="userId", required=false) String userId,
	                           @RequestParam(value="postNo", required=false) int postNo,
	                           HttpSession session, Model model,
	                           HttpServletRequest req) throws JsonProcessingException{
	 
	    
	      int like = galleryService.findLike(postNo, userId);
	      if(like>=1) {
	  		 galleryService.likeDown(postNo, userId);
	      }
	      else {
			galleryService.likeUp(postNo,userId);
	      }
	      int getpostlikes = galleryService.getpostlikes(postNo);
	      return getpostlikes;
	   }
	
	   
	   @CrossOrigin
	   @RequestMapping(value="post/AddCartInView.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody
		public String AddCartInView(Model model,@RequestParam("pdNo") int pdNo, @ModelAttribute("userId") String userId) {
			
		   Map map = new HashMap();
		   map.put("userId", userId);
		   map.put("pdNo", pdNo);
		   
		   //1) 카트에 상품 있는지 check
		   int isAdded = galleryService.findCart(map);
		   
		   //2) 1이면 DELETE 0이면 INSERT
		   if(isAdded>=1) {galleryService.deleteCart(map);}
		   else{galleryService.insertCart(map);}
			
			return "{\"cart\":\"sucsses\"}";
		}
	   
	   @CrossOrigin
	   @RequestMapping(value="post/CartInList.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody
		public String CartInList(Model model,@RequestParam("postNo") int postNo, @ModelAttribute("userId") String userId) {
			
		   Map map = new HashMap();
		   map.put("userId", userId);
		   map.put("postNo", postNo);
		   
		   //1) 카트에 상품 있는지 check
		   int isCartedList = galleryService.findCartinList(map);
		   
		   //1.1) pdNo 알아오기
		   int pdNo = galleryService.findPdNo(map);
		   map.put("pdNo", pdNo);
		   
		   //2) 1이면 DELETE 0이면 INSERT
		   if(isCartedList>=1) {galleryService.deleteCart(map);}
		   else{galleryService.insertCart(map);}
			
			return "{\"cart\":\"sucsses\"}";
		}
	   
	   
	   @GetMapping("GalleryAlarm.do")
		public String GalleryAlarm(Model model,@RequestParam("postTitle") String postTitle, @RequestParam("userNo") int userNo, Map map) {
			
			Map postMap = new HashMap<>();
		
			postMap.put("userNo", userNo);
			postMap.put("postTitle",postTitle);
			
			int postNo = galleryService.getAlarmpostNo(postTitle);
			String userId = galleryService.getAlarmUserId(userNo);
			
			
			
			//1. photoUrl 먼저 가져오기
			List<GalleryDTO> photoLists = galleryService.galleryPhoto(postNo);
			for(GalleryDTO photoUrls : photoLists) {
				//상수로 ip 주소 붙이기
				photoUrls.setPhotoUrl(resource+photoUrls.getPhotoUrl());
			}
			
			//2. 나머지 본문 정보 추출
			List<GalleryDTO> viewLists = galleryService.galleryView(postNo);
			
			for(GalleryDTO viewList : viewLists) {
				switch(viewList.getPostCategory()) {
				case "landscape": viewList.setPostCategory("풍경"); break;
				case "object": viewList.setPostCategory("정물"); break;
				case "figure": viewList.setPostCategory("인물"); break;
				default: viewList.setPostCategory("기타"); break;
				}	
			}
			
			//3. 작가의 다른 정보 위해 각 포스트 몇개인지 총합, 각 포스트 썸네일, 포스트 no 가져와야함
			List<GalleryDTO> infoLists = galleryService.galleryInfo(postNo);
			GalleryDTO createrInfo = infoLists.get(0);
			System.out.println("view 들어갈때 한번만 찍어보자 진짜 마지막: "+ createrInfo);
			model.addAttribute("createrProfile",createrInfo.getUserProfile());
			model.addAttribute("createrNickname",createrInfo.getUserNickname());
			model.addAttribute("createrPostCount",createrInfo.getPostCount());
			model.addAttribute("createrUserNo",createrInfo.getUserNo());
			
			//4. 수정 삭제용 세션 아이디 저장
			model.addAttribute("userId",userId);
			
			//5. 댓글 코멘트 갖고 오기(postNo 넘기고!)
			List<GalleryDTO> comments = galleryService.getComments(postNo);
			
			//6. 판매하는 경우 상품 정보 가져오기
			int isSellorNot = galleryService.isSellorNot(postNo);
			if(isSellorNot==1) {
				model.addAttribute("isSellorNot",isSellorNot);
				GalleryDTO product = galleryService.getProductInfo(postNo);
				model.addAttribute("product", product);
				model.addAttribute("pdNo",product.getPdNo());
				model.addAttribute("photoNo",product.getPhotoNo());
				model.addAttribute("pdPrice",product.getPdPrice());
				model.addAttribute("pdSalesNo",product.getPdSalesNo());
				model.addAttribute("pdDate",product.getPdDate());
				
				//카트정보 저장해 뿌리기
				map.put("userId", userId);
				map.put("postNo", postNo);
				int isAdded = galleryService.findCart(map);
				
				model.addAttribute("isCart",isAdded);
			}
			
			
			
			//7. MAP 첨부했는지 체크해서 가져오기
			int isMapAttached = galleryService.isMapAttached(postNo);
			
			if(isMapAttached==1) {
				GalleryDTO mapInfo = galleryService.getMapInfo(postNo);
				String markerLocation = mapInfo.getMarkerLocation();
				String lat=markerLocation.split(",")[0];
				String lng=markerLocation.split(",")[1];
				
				model.addAttribute("lat",lat);
				model.addAttribute("lng",lng);
			}
			
			//8. 로그인 한 사람 정보 다 갖고오기
			GalleryDTO loginUser = galleryService.getLoginInfo(userId);
			model.addAttribute("loginUser",loginUser);
			
			//8. Model에 정보 저장 후 돌아가기
			model.addAttribute("postNo",postNo);
			model.addAttribute("comments",comments);
			model.addAttribute("photoUrls",photoLists);
			model.addAttribute("viewLists",viewLists);
			//model.addAttribute("infoLists", infoLists);
			//model.addAttribute("otherWorks",infoLists.get(0).getPostCount());
			//model.addAttribute("postLikes",infoLists.get(0).getPostLikes());
			model.addAttribute("userProfile",viewLists.get(0).getUserProfile());
			model.addAttribute("userNickname",viewLists.get(0).getUserNickname());
			model.addAttribute("postLikes",viewLists.get(0).getPostLikes());
			model.addAttribute("postHits",viewLists.get(0).getPostHits());
			model.addAttribute("postSellorNot",viewLists.get(0).getPostSellorNot());
			model.addAttribute("postTitle",viewLists.get(0).getPostTitle());
			
			
			return "gallery/GalleryView.tiles";
		}
	   
	   
	   //필터 
	   @RequestMapping(value="filter.do", produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String filter(Model model,@RequestParam(value="checkList[]") String[] postCategory) throws JsonProcessingException{	 
		   
		   
		   
		   List<GalleryDTO> result = galleryService.galleryFilter(postCategory);
		   
			model.addAttribute("lists",result);
			

			return objectMapper.writeValueAsString(result);
	   }
	   
	   
	   
	   //판매중인 사진보기
	   @RequestMapping(value="sellCheck.do", produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String filter(Model model, @RequestParam(value="sellList") String postSellorNot) throws JsonProcessingException{	 
		  
		   System.out.println("sell.do 시작????");
		   List<GalleryDTO> result = galleryService.gallerySell(postSellorNot);
		   
			model.addAttribute("lists",result);
			
			  System.out.println(result);
			return objectMapper.writeValueAsString(result);
	   }
	   
	   
	   
}
