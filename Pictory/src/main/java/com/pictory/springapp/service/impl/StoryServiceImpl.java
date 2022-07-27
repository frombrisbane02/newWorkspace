package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;

@Service("storyService")
public class StoryServiceImpl implements StoryService<StoryDTO>{
	
	@Autowired
	private StoryDAO dao;

	@Override
	public List<StoryDTO> virtualList() {
		//호출해서 List를 담아오면 for문 돌면서 풀어헤쳐서 거기에 다 담아서 호출하는거임
		System.out.println("서비스까지는...오니?");
		
		//List<StoryDTO> storyList = 
//		System.out.println("서비스까지는...오니?22");
//		System.out.println(storyList);
//		
//		for(StoryDTO storyOne : storyList) {
//			System.out.println("storyone에 담긴 sNo: "+ storyOne.getSNo());
//			System.out.println("storyone에 담긴 title: "+ storyOne.getStoryTitle());
//			System.out.println("storyone에 담긴 desc: "+ storyOne.getStoryDescription());
//			System.out.println("storyone에 담긴 nick: "+ storyOne.getUserNickname());
//			
//		}
		return dao.virtualList();
	}
	
	
	@Override
	public List<StoryDTO> virtualImages(List<StoryDTO> returnValue){
		
		List<StoryDTO> storyImages = dao.virtualImages(returnValue);
		System.out.println(storyImages);
		
//		for(StoryDTO storyImages : storyImages) {
//			System.out.println("storyImages에 담긴 sNo: "+ storyImages.getSNo());
//			System.out.println("storyImages에 담긴 Url: "+ storyImages.getPhotoUrl());
//			
//		}
		
	return null;
	}
	

}