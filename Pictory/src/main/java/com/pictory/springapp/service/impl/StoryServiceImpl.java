package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;

@Service("storyService")
public class StoryServiceImpl implements StoryService<StoryDTO> {

	@Autowired
	private StoryDAO dao;

	@Override
	public List<StoryDTO> virtualList() {

		return dao.virtualList();
	}


	// =====0728
	@Override
	public List<StoryDTO> virtualImages(int sNo) {
		System.out.println("서비스 virtualImages...오니?");
		
		List<StoryDTO> storyImages = dao.virtualImages(sNo);
		System.out.println(storyImages);
	

		return storyImages;
	}

}