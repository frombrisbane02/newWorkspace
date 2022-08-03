package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

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
		
		return dao.selectGalleryList();
	}
	
	@Override
	public List<GalleryDTO> galleryPhoto(int postNo) {
		System.out.println("Impl.1 클릭한 postNo: "+postNo);
		
		return dao.selectPhotoList(postNo);
	}

	@Override
	public List<GalleryDTO> galleryView(int postNo) {
		System.out.println("Impl.2 클릭한 postNo: "+postNo);
		
		return dao.selectGalleryView(postNo);
	}

	@Override
	public List<GalleryDTO> galleryInfo(int postNo) {
		//작가 정보 뿌려주기위한 글
		return dao.selectUserInfo(postNo);
	}



}
