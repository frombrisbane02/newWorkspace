package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface StoryService<T>{

	//List<T> virtualList(List<StoryDTO> storyList);
	// storyIndex 리스트 Story 정보 저장
	List<T> virtualList();
	
	// 사진저장
	List<T> virtualImages(List<StoryDTO> returnValue);
	
	
}
