package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FeedArtworkService;
import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;

@Service("FeedArtworkService")
public class FeedArtworkServiceImpl implements FeedArtworkService<FeedDTO> {
	
	@Autowired
	private FeedArtworkDAO dao;

	@Override
	public List<FeedDTO> artworkList() {
		//필요 인자: 카테고리, 해시태그, 첫번째 이미지 url(썸네일용), 좋아요수, 댓글 수, 유저프사, 유저닉네임
		
		return dao.artworkSelectList();
	}
	



}
