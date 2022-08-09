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
		System.out.println("###lists:"+lists.get(0));
		model.addAttribute("lists",lists);
		System.out.println("###lists###:"+lists);
		List postNum = galleryService.findUserPostno(userId);
		System.out.println("###postNum###:"+postNum);
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
	
	
	@GetMapping("GalleryView.do")
	public String GalleryView(Model model,@RequestParam("postNo") int postNo, @ModelAttribute("userId") String userId, Map map) {
		//postNo만 넘겨서 해당 내용 가져와서 뿌려주기
		//title, category, photourl(순서대로), userNickname, 프사 url
		
		System.out.println("===========view 반환===========");
		System.out.println("클릭한 postNo: "+postNo);
		//System.out.println("클릭한 postNo: "+userNo);

		
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
		model.addAttribute("userId",map.get("userId"));
		
		//5. 댓글 코멘트 갖고 오기(postNo 넘기고!)
		List<GalleryDTO> comments = galleryService.getComments(postNo);
		
		//6. 판매하는 경우 상품 정보 다 갖고오기(어차피 하나임 ㅇㅇ)
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
			
			//카트정보도 저장해서 뿌리자잉
			map.put("userId", userId);
			map.put("postNo", postNo);
			int isAdded = galleryService.findCart(map);
			
			model.addAttribute("isCart",isAdded);
		}
		
		
		
		//7. MAP 첨부했는지? 있으면 갖고오기(어차피 하나임)
		int isMapAttached = galleryService.isMapAttached(postNo);
		if(isMapAttached==1) {
			//count = 1이니까 정보 전부 가지고와서 저장하기
			GalleryDTO mapInfo = galleryService.getMapInfo(postNo);
			String markerLocation = mapInfo.getMarkerLocation();
			String lat=markerLocation.split(",")[0];
			String lng=markerLocation.split(",")[1];
			
			System.out.println("latlatlatlat======"+lat);
			System.out.println("lnglnglnglng======"+lng);
			
			model.addAttribute("lat",lat);
			model.addAttribute("lng",lng);
			
		}
		
		//8. 로그인 한 사람 정보 다 갖고오기
		GalleryDTO loginUser = galleryService.getLoginInfo(userId);
		System.out.println("login한애 정보 다 갖고오니?: "+loginUser);
		model.addAttribute("loginUser",loginUser);
		
		
		//8. Model에 정보 저장 후 돌아가기
		model.addAttribute("postNo",postNo);
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
		model.addAttribute("postTitle",viewLists.get(0).getPostTitle());
		
		
		return "gallery/GalleryView.tiles";
	}
//	@ModelAttribute("userId") 
//	@GetMapping("/getlike.do")
//	public Object getlike(HttpSession session,Model model,String userId,@ModelAttribute("postNo")int postNo) {
//		System.out.println("###getlike###컨트롤러 페이지");
//		LikeDTO dto = new LikeDTO();
//		Map<String, Object> map = new HashMap<>();
//		map.put("userId", "userId");
//		int userNo=galleryService.userNum(map);
//		model.addAttribute("userNo",userNo);
//		System.out.println("###flag.userNo###:"+userNo);
//		System.out.println("###post###:"+postNo);
//		System.out.println("###userId###:"+userId);
//		
//		List<GalleryDTO> postNum = galleryService.galleryView(postNo);
//		model.addAttribute("postNo", postNo);
//		map.put("userNo", "userNo");
//		map.put("postNo", "postNo");
//		
//		dto.setPostNo(postNo);
//		dto.setUserNo(userNo);
//	
//		System.out.println("####userNo####:"+userNo);
//		System.out.println("####postNo####:"+postNo);
//		
//		int like = galleryService.findLike(map, postNo, userNo);
//		model.addAttribute("likes", map);
//		model.addAttribute("like",like);
//		session.setAttribute("like",like);
//		System.out.println("###like###:"+like);
//		return map;
//	}
	
	@CrossOrigin
	@RequestMapping(value="post/SubmitComment.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String comment(@RequestParam String cText, @RequestParam String userId, 
									@RequestParam int postNo ,HttpSession session, Model model,
									HttpServletRequest req) throws JsonProcessingException{
		
		System.out.println("댓글내용 출력: "+cText);
		System.out.println("댓글쓴사람(지금 로그인한 사람) 누구세요?: "+userId);
		System.out.println("지금 postNo 몇번?"+postNo);
		
		//commentarea=이렇게 나오니까 여기서부터 짤라서 준다..
		String realComment = cText.substring(12);
		System.out.println("찐 이거맞냐?"+realComment);
		
		//DB저장위해 넘겨야할 값: postNo, userNo(댓글쓴애), cText
		Map map = new HashMap();
		map.put("postNo", postNo);
		map.put("userId", userId);
		map.put("cText", realComment);
		
		//서비스호출(댓글 insert)
		galleryService.galleryComment(map);
		
		

		return "{\"upload\":\"sucsses\"}";
	}

	   @CrossOrigin
	   @RequestMapping(value="post/Likes.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody 
	   public int likes(@RequestParam(value="userId", required=false) String userId,
	                           @RequestParam(value="postNo", required=false) int postNo,
	                           HttpSession session, Model model,
	                           HttpServletRequest req) throws JsonProcessingException{
	 
	      System.out.println("컨트롤러에서 받은 userId:"+userId);
	      System.out.println("컨트롤러에서 받은 postNo:"+postNo);
	      int like = galleryService.findLike(postNo, userId);
	      System.out.println("like:"+like);
	      if(like>=1) {
	    	 System.out.println("좋아요 취소!");
	  		 galleryService.likeDown(postNo, userId);
	      }
	      else {
	  		System.out.println("좋아요 업!");
			galleryService.likeUp(postNo,userId);

	      }
	      
	      return like;
	   }
	
	
	/*
	   @RequestMapping("filter.do")
	   public String filter(Model model,@RequestParam String[] postCategory){
		   
		   System.out.println("======filter.do 도착(종근)");
		   System.out.println("postCategory"+postCategory);
		   /*
		   List<String> lists =new Vector<>();
		   for(int i=0 ; i <postCategory.length ; i++ ) {
			   lists.add(postCategory[i]);
		   
		   }
		   List<GalleryDTO> result = galleryService.galleryFilter(postCategory);
		   //System.out.println(map);
			
			model.addAttribute("lists",result);
			

			return "gallery/GalleryList";
	   }
	 */
	   
	   @RequestMapping(value="filter.do", produces = "application/json;charset=UTF-8")
	   @ResponseBody
	   public String filter(Model model,@RequestParam(value="checkList[]") String[] postCategory) throws JsonProcessingException{
		   
		   System.out.println("======filter.do 도착(종근)");
		   System.out.println(postCategory);
		   List<GalleryDTO> result = galleryService.galleryFilter(postCategory);

		   
			System.out.println("22======================");
			//model.addAttribute("lists",result);
			

			return objectMapper.writeValueAsString(result);
	   }
	   
	   
	   @CrossOrigin
	   @RequestMapping(value="post/AddCartInView.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody
		public String AddCartInView(Model model,@RequestParam("pdNo") int pdNo, @ModelAttribute("userId") String userId) {
			
		   System.out.println("로그인한애 누구세요?"+userId);
		   System.out.println("지금 상품 번호가?"+pdNo);
		   
		   Map map = new HashMap();
		   map.put("userId", userId);
		   map.put("pdNo", pdNo);
		   
		   //db 저장 처리
		   //1) 카트에 이미 상품 있는지 COUNT - INT 값 반환후
		   int isAdded = galleryService.findCart(map);
		   
		   //2) 1이면 DELETE 0이면 INSERT
		   if(isAdded>=1) {
			   //cart delete 처리
			   galleryService.deleteCart(map);
		   }
		   else{
			   //cart insert 처리
			   galleryService.insertCart(map);
		   }
			
			return "{\"upload\":\"sucsses\"}";
		}
	   
}
