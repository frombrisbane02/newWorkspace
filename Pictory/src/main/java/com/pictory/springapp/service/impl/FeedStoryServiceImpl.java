package com.pictory.springapp.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedStoryService;






@Service("feedStoryService")
public  class FeedStoryServiceImpl implements FeedStoryService<FeedDTO> {
	
	@Autowired
	private FeedStoryDAO dao;

	@Override
	public List<FeedDTO> virtualList() {

		return dao.virtualList();
	}

	@Override
	public List<FeedDTO> virtualImages(int sNo) {

		return dao.virtualImages(sNo);
	}

}



