package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface StoryService<T>{

	List<T> virtualList();
	
	// 사진저장
	//List<T> virtualImages(List<StoryDTO> returnValue);
	
	List<T> virtualImages();
	
	//상세보기용
	//T selectOne(List list);
	
	
}
