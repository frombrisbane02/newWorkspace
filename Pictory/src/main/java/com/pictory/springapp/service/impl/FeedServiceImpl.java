package com.pictory.springapp.service.impl;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedService;





@Service("feedService")
public  class FeedServiceImpl implements FeedService<FeedDTO> {
	
	@Autowired
	private FeedDAO dao;

	@Override
	public FeedDTO feedInfo(String id) {
		FeedDTO dto = null;
		try {
		dto = dao.feedInfo(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	

}


