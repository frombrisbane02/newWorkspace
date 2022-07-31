package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface StoryService<T>{

	List<T> virtualList();
	
	
	List<T> virtualImages(int sNo);

	
	
}
