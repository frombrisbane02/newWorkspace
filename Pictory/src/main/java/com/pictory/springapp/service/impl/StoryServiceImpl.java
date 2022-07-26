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
	
	//@Override
	//public List<StoryDTO> virtualList(Map map){
	//return dao.virtualList(map);
	//}

	@Override
	public List<StoryDTO> virtualList(List<StoryDTO> storyList) {
		//호출해서 List를 담아오면 for문 돌면서 풀어헤쳐서 거기에 다 담아서 호출하는거임
		for(StoryDTO storyOne : storyList) {
			dao.virtualList(storyOne);
		}
		return null;
	}
}