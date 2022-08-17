package com.pictory.springapp.service.impl;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedService;





@Service("feedService")
public  class FeedServiceImpl implements FeedService<FeedDTO> {
	
	@Autowired
	private FeedDAO dao;
	
	String resource = Constants.RESOURCE.toString();

	@Override
	public FeedDTO feedInfo(String id) {
		FeedDTO dto = null;
		try {
		dto = dao.feedInfo(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		if(!(dto.getUserProfile().contains("k.kakaocdn.net")))
		return dto;
		return dto;
	}

	
	@Override
	public List<FeedDTO> replyselect(int userNo) {
		
		 List<FeedDTO> tmp = dao.replyselect(userNo);
		 for(FeedDTO tmps : tmp) {
			 tmps.setPostNo(userNo);
			 tmps.setPhotoUrl(resource+tmps.getPhotoUrl());
		 }
		 
		 
		 
		 return tmp;
	}


	@Override
	public FeedDTO feedInfoOther(int userNo) {
		
		return dao.feedInfoOther(userNo);
	}
}


