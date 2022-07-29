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

	/*
	 * ====================0726
	 * 
	 * @Override public List<StoryDTO> virtualImages(List<StoryDTO> returnValue){
	 * 
	 * List<StoryDTO> storyImages = dao.virtualImages(returnValue);
	 * System.out.println(storyImages);
	 * 
	 * // for(StoryDTO storyImages : storyImages) { //
	 * System.out.println("storyImages에 담긴 sNo: "+ storyImages.getSNo()); //
	 * System.out.println("storyImages에 담긴 Url: "+ storyImages.getPhotoUrl()); // //
	 * }
	 * 
	 * return null; }
	 */

	// =====0728
	@Override
	public List<StoryDTO> virtualImages() {
		System.out.println("서비스 virtualImages...오니?");
		
		List<StoryDTO> storyImages = dao.virtualImages();
		System.out.println(storyImages);
	

		return storyImages;
	}

}