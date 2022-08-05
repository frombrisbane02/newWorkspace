package com.pictory.springapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/gallery/")
public class GalleryController {
	
	@Autowired
	private GalleryService<GalleryDTO> galleryService;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	
	
	@GetMapping("GalleryList.do")
	public String galleryList(Model model) {
		//상단바 갤러리 클릭시 List에 뿌려줄 정보 저장해서 뿌리기
		
		List<GalleryDTO> lists = galleryService.galleryList();
		List<GalleryDTO> hashs = galleryService.hashList();
		model.addAttribute("lists",lists);
		model.addAttribute("hashs",hashs);
		return "gallery/GalleryList";
	}
	
	@PostMapping("GalleryList")
	public String galleryList2(Model model) {
		List<GalleryDTO> lists = galleryService.galleryList();
		model.addAttribute("lists",lists);
		
		return "gallery/GalleryList";
		
	}
	
	
	@GetMapping("GalleryView.do")
	public String GalleryView(Model model,@RequestParam("postNo") int postNo, @ModelAttribute("userId") String userId, Map map) {
		//postNo만 넘겨서 해당 내용 가져와서 뿌려주기
		//title, category, photourl(순서대로), userNickname, 프사 url
		
		System.out.println("===========view 반환===========");
		System.out.println("클릭한 postNo: "+postNo);
		
		Map postMap = new HashMap<>();
		postMap.put("postNo", postNo);
		postMap.put("userId", userId);
		
		//1. photoUrl 먼저 가져오기
		List<GalleryDTO> photoLists = galleryService.galleryPhoto(postNo);
		for(GalleryDTO photoUrls : photoLists) {
			System.out.println("컨트롤러 postUrls:"+ photoUrls.getPhotoUrl());
			photoUrls.setPhotoUrl(resource+photoUrls.getPhotoUrl());
		}
		
		//2. 나머지 본문 정보 전부 갖고오기
		List<GalleryDTO> viewLists = galleryService.galleryView(postNo);
		
		for(GalleryDTO viewList : viewLists) {
			System.out.println("소리코의 가지고온 viewLists에서 꺼내오기"+viewList.getUserId());
		}
		
		//3. 작가의 다른 정보 위해 각 포스트 몇개인지 총합, 각 포스트 썸네일, 포스트 no 가져와야함
		List<GalleryDTO> infoLists = galleryService.galleryInfo(postNo);
		
		//4. 수정 삭제용 세션 아이디 저장
		System.out.println("소리코의 sessionId: 갖고오니..?;;"+map.get("userId"));
		model.addAttribute("sessionId",map.get("userId"));
		
		//5. 댓글 코멘트 갖고 오기(postNo 넘기고!)
		List<GalleryDTO> comments = galleryService.getComments(postNo);
		
		//6. 판매하는 경우 상품 정보 다 갖고오기(어차피 하나임 ㅇㅇ)
		//if count해서 product 테이블 있나 보고 ..
		if(galleryService.isSellorNot(postNo)==1) {
			GalleryDTO product = galleryService.getProductInfo(postNo);
			model.addAttribute("product", product);
		}
		
		
		//7. Model에 정보 저장 후 돌아가기
		model.addAttribute("comments",comments);
		model.addAttribute("photoUrls",photoLists);
		model.addAttribute("viewLists",viewLists);
		model.addAttribute("infoLists", infoLists);
		model.addAttribute("otherWorks",infoLists.get(0).getPostCount());
		model.addAttribute("postLikes",infoLists.get(0).getPostLikes());
		model.addAttribute("userProfile",viewLists.get(0).getUserProfile());
		model.addAttribute("userNickname",viewLists.get(0).getUserNickname());
		model.addAttribute("postLikes",viewLists.get(0).getPostLikes());
		model.addAttribute("postHits",viewLists.get(0).getPostHits());
		model.addAttribute("postSellorNot",viewLists.get(0).getPostSellorNot());
		
		
		return "gallery/GalleryView";
	}
	
	
	   @RequestMapping("filter.do")
	   public String filter(Model model,@RequestParam String[] postCategory){
		   
		   System.out.println("======filter.do 도착(종근)");
		   /*
		   List<String> lists =new Vector<>();
		   for(int i=0 ; i <postCategory.length ; i++ ) {
			   lists.add(postCategory[i]);
		   
		   }*/
		   List<GalleryDTO> result = galleryService.galleryFilter(postCategory);
		   //System.out.println(map);
			
			model.addAttribute("lists",result);
			

			return "gallery/GalleryList";
	   }
	
//	
//	   @RequestMapping("filter.do")
//	   public String filter(Model model,@RequestParam String[] postCategory){
//		   
//		   String result = postCategory[0];
//		   for(int i=1 ; i <postCategory.length ; i++ ) {
//			   
//			   System.out.println(postCategory[i]);
//			   result +="," +postCategory[i];
//		   }
//		   model.addAttribute("postCategory", result);
//		   
//		   System.out.println("======filter.do 도착(종근)");
//		   
//	
//			List<GalleryDTO> lists = galleryService.galleryFilter(result);
//			//model.addAttribute("lists",lists);
//			
//
//			return "gallery/GalleryList";
//	   }
	   
	   
	
	
	
}
