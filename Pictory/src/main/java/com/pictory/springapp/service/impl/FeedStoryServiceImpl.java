package com.pictory.springapp.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedService;
import com.pictory.springapp.dto.FeedStoryService;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.StoryDTO;





@Service("feedStoryService")
public  class FeedStoryServiceImpl implements FeedStoryService<FeedDTO> {
	
	@Autowired
	private FeedStoryDAO dao;

	@Override
	public List<FeedDTO> virtualList() {

		return dao.virtualList();
	}


	// =====0728
	@Override
	public List<FeedDTO> virtualImages(int sNo) {
		//System.out.println("서비스 virtualImages...오니?");
		
		List<FeedDTO> feedStoryImages = dao.virtualImages(sNo);
		//System.out.println(storyImages);
	

		return feedStoryImages;
	}

}



