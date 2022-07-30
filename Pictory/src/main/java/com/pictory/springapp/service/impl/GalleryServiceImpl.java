package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService<GalleryDTO> {
	
	@Autowired
	private GalleryDAO dao;

	@Override
	public List<GalleryDTO> galleryList() {
		//필요 인자: 카테고리, 해시태그, 첫번째 이미지 url(썸네일용), 좋아요수, 댓글 수, 유저프사, 유저닉네임
		List<GalleryDTO> resultList = dao.selectGalleryList();
		
		System.out.println("DAO ResultList: "+resultList);
		
		for(GalleryDTO oneResult: resultList) {
			System.out.println("============================================");
			System.out.println("카테고리 :"+oneResult.getPostCategory());
			System.out.println("타이틀 :"+oneResult.getPostTitle());
			System.out.println("좋아요숫자 :"+oneResult.getPostLikes());
			System.out.println("글번호 :"+oneResult.getPostNo());
			System.out.println("유저아이디 :"+oneResult.getUserId());
			System.out.println("유저닉네임 :"+oneResult.getUserName());
			System.out.println("첫사진!!:"+oneResult.getPhotoUrl());
			System.out.println("============================================");
		}
		return dao.selectGalleryList();
	}

}
