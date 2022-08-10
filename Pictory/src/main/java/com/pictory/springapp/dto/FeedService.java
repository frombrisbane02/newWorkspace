package com.pictory.springapp.dto;

import java.util.List;

public interface FeedService<T>{
	
	FeedDTO feedInfo(String id);


	List<FeedDTO> replyselect(int userNo);


	
}
