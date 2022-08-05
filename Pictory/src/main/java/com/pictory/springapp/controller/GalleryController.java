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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.fasterxml.jackson.core.JsonProcessingException;
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
		model.addAttribute("userId",map.get("userId"));
		
		//5. 댓글 코멘트 갖고 오기(postNo 넘기고!)
		List<GalleryDTO> comments = galleryService.getComments(postNo);
		
		//6. 판매하는 경우 상품 정보 다 갖고오기(어차피 하나임 ㅇㅇ)
		//if count해서 product 테이블 있나 보고 ..
		
		int isSellorNot = galleryService.isSellorNot(postNo);
		if(isSellorNot==1) {
			model.addAttribute("isSellorNot",isSellorNot);
			GalleryDTO product = galleryService.getProductInfo(postNo);
			model.addAttribute("pdNo",product.getPdNo());
			model.addAttribute("photoNo",product.getPhotoNo());
			model.addAttribute("pdPrice",product.getPdPrice());
			model.addAttribute("pdSalesNo",product.getPdSalesNo());
			model.addAttribute("pdDate",product.getPdDate());
			
		}
		
		
		//7. Model에 정보 저장 후 돌아가기
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
		
		
		return "gallery/GalleryView";
	}
	
	@CrossOrigin
	@RequestMapping(value="post/SubmitComment.do",produces = "application/json;charset=UTF-8")
	public @ResponseBody String image(@RequestParam String base64, @RequestParam String filename, 
									@RequestParam int base64Index ,HttpSession session, Model model,
									HttpServletRequest req) throws JsonProcessingException{
		
		//서버의 물리적 경로 얻어서 파일 업로드 처리 먼저
		//1.1) PATH 먼저! userId 붙여서 설정하기
		String path = req.getSession().getServletContext().getRealPath("/upload")+"\\img\\";
		System.out.println("IEC) path는 제대로 가지고 왔나요? :"+ path);
		
		//1.2) 파일 객체 생성하기
		
		
		//1.3) mkdir로 폴더 있으면 냅두고 없으면 생성
		
		Map<String, Object> fileInfo = new HashMap<String, Object>();
		model.addAttribute(fileInfo);
		
		List<Map<String,Object>> fileInfos = new ArrayList<Map<String,Object>>();
		fileInfos.add(fileInfo);
		
		model.addAttribute("fileInfos",fileInfos);


		
		
		return "{\"upload\":\"sucsses\"}";
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
