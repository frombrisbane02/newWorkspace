package com.pictory.rest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import com.pictory.rest.service.GalleryDTO;
import com.pictory.rest.service.impl.GalleryService;

@RestControllerAdvice
@RestController
public class GalleryController {
	
	@Autowired(required = false)
	private GalleryService galleryService;
	
	@CrossOrigin
	@PostMapping("/galley/feedGalleryList")
	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {
		return galleryService.feedGalleryList(dto);
	}
	
	//작품 태그 리스트
	@CrossOrigin
	@PostMapping("/galley/galleryList")
	public List<GalleryDTO> galleryList(@RequestParam Map<String, String> map) {		
		return galleryService.galleryList(map);
	}
	
	@CrossOrigin
	@PostMapping("/galley/storyList")
	public List<GalleryDTO> storyList(GalleryDTO dto) {
		System.out.println("userNoStroy:"+dto.getUserNo());
		return galleryService.storyList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/storyPictureList")
	public List<GalleryDTO> storyPictureList(GalleryDTO dto) {
		return galleryService.storyPictureList(dto);
	}
	
	@CrossOrigin
	@GetMapping(value="/galley/museum")
	public Map<String,List<Map<String,String>>> museum(@RequestParam String sNo) {
		GalleryDTO dto = new GalleryDTO();
		dto.setSNo(sNo);		
		List<Map<String,String>> lists=new Vector<>();
		List<GalleryDTO> photos = galleryService.storyPictureList(dto);
		
		for(GalleryDTO photo:photos) {
			Map<String,String> map = new HashMap<>();
			map.put("image_url","http://192.168.0.27:4040/springapp/upload/img/"+photo.getPhotoUrl());
			map.put("image_title",photo.getPhotoName());
			map.put("image_id",photo.getPhotoNo());
			lists.add(map);
		}
		
		Map<String,List<Map<String,String>>> map = new HashMap<>();
		map.put("data", lists);
		return map;
	}/////////////////
	
	
	@CrossOrigin
	@GetMapping("/galley/salesGalleryListTop")
	public List<GalleryDTO> salesGalleryListTop() {
		return galleryService.salesGalleryListTop();
	}
	
	@CrossOrigin
	@PostMapping("/galley/createrList")
	public List<GalleryDTO> createrList(GalleryDTO dto) {	
		return galleryService.createrList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/salesGalleryList")
	public List<GalleryDTO> salesGalleryList(GalleryDTO dto) {
		System.out.println("userNo:"+dto.getUserNo());
		return galleryService.salesGalleryList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/galleryView")
	public GalleryDTO galleryView(GalleryDTO dto) {
		int affected = galleryService.updatePosthits(dto);		
		if (affected > 0) {System.out.println("조회수 업데이트 완료");}
		else {System.out.println("조회수 업데이트 실패");}		
		//GalleryDTO ddto = galleryService.galleryView(dto);
		//System.out.println("라이크 여부:"+ddto.getLikeCnt());		
		return galleryService.galleryView(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/galleryViewPhotoList")
	public List<GalleryDTO> galleryViewPhotoList(GalleryDTO dto) {
		return galleryService.galleryViewPhotoList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/insertLikes")
	public void insertLikes(GalleryDTO dto) {
		int affected = galleryService.insertLikes(dto);
		/*
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("postNo:"+dto.getPostNo());		
		if (affected > 0) {System.out.println("좋아요 수 증가 완료");}
		else {System.out.println("좋아요 수 증가 실패");}*/
	}
	
	@CrossOrigin
	@PostMapping("/galley/deleteLikes")
	public void deleteLikes(GalleryDTO dto) {
		int affected = galleryService.deleteLikes(dto);
		/*
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("postNo:"+dto.getPostNo());		
		if (affected > 0) {System.out.println("좋아요 수 삭제 완료");}
		else {System.out.println("좋아요 수 삭제 실패");}*/
	}
	
	@CrossOrigin
	@PostMapping("/galley/cartList")
	public List<GalleryDTO> cartList(GalleryDTO dto) {	
		return galleryService.cartList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/galley/deleteCart")
	public void deleteCart(GalleryDTO dto) {
		int affected = galleryService.deleteCart(dto);
		/*
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("pdNo:"+dto.getPdNo());		
		if (affected > 0) {System.out.println("카트 삭제 완료");}
		else {System.out.println("카트 삭제 실패");}
		*/
	}
	
	@CrossOrigin
	@PostMapping("/galley/insertCart")
	public void insertCart(GalleryDTO dto) {		
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("postNo:"+dto.getPostNo());
		
		int affected = galleryService.insertCart(dto);		
		/*	
		if (affected > 0) {System.out.println("카트 추가 완료");}
		else {System.out.println("카트 추가 실패");}
		*/
	}
	
	@CrossOrigin
	@PostMapping("/gallery/orderCompleted")
	public boolean orderCompleted(@RequestParam String userNo,@RequestParam String paymentTotal,@RequestParam Map<String,String> dtoList) {		
		boolean isSucess = galleryService.orderCompleted(userNo,paymentTotal,dtoList);
		System.out.println("isSucess:"+isSucess);		
		return isSucess;
	}
	
	@CrossOrigin
	@PostMapping("/gallery/orderDayList")
	public List<GalleryDTO> orderDayList(GalleryDTO dto) {
		System.out.println("userNo:"+dto.getUserNo());
		return galleryService.orderDayList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/gallery/orderList")
	public List<GalleryDTO> orderList(GalleryDTO dto) {
		System.out.println("paymentNo:"+dto.getPaymentNo());
		return galleryService.orderList(dto);
	}
	
	@CrossOrigin
	@PostMapping("/gallery/insertPost")
	public Map<String,String> insertPost(@RequestParam Map<String,String> map) {
		System.out.println("userNo:"+map.get("userNo"));
		System.out.println("sNo:"+map.get("sNo"));
		System.out.println("postTitle:"+map.get("postTitle"));
		System.out.println("postSellOrNot:"+map.get("postSellOrNot"));
		System.out.println("postCategory:"+map.get("postCategory"));
		System.out.println("postText:"+map.get("postText"));		
		String postNo = galleryService.insertPost(map);
		map.put("postNo", postNo);
		System.out.println("postno:"+postNo);
		return map;
	}
	
	@CrossOrigin
	@PostMapping("/gallery/storyView")
	public GalleryDTO storyView(GalleryDTO dto) {
		System.out.println("sNo:"+dto.getSNo());		
		return galleryService.storyView(dto);
	}
	
	@CrossOrigin
	@PostMapping("/gallery/creatorView")
	public GalleryDTO creatorView(GalleryDTO dto) {
		return galleryService.creatorView(dto);
	}
	
	@CrossOrigin
	@PostMapping("/gallery/insertFollow")
	public void insertFollow(GalleryDTO dto) {
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("creatorNo:"+dto.getCreatorNo());
		
		int affected = galleryService.insertFollow(dto);

		if (affected > 0) {System.out.println("팔로우 완료");}
		else {System.out.println("팔로우 실패");}
	}
	
	@CrossOrigin
	@PostMapping("/gallery/deleteFollow")
	public void deleteFollow(GalleryDTO dto) {
		System.out.println("userNo:"+dto.getUserNo());
		System.out.println("creatorNo:"+dto.getCreatorNo());
		
		int affected = galleryService.deleteFollow(dto);
	
		if (affected > 0) {System.out.println("팔로우 삭제 완료");}
		else {System.out.println("팔로우 삭제 실패");}
	}
	
}
