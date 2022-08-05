package com.pictory.springapp.dto;

import java.util.List;


public interface FeedStoryService<T>{
	
	List<T> virtualList();
	
	
	List<T> virtualImages(int sNo);

	
}
