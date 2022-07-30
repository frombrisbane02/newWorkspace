package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FeedDTO;


@Service("feedService")
public class FeedServiceImpl {
	
	@Autowired
	private FeedDAO dao;

	
	public List<FeedDTO> selectFeedList() {
		
		List<FeedDTO> resultList =dao.feedList();
		
		System.out.println("DAO ResultList: "+resultList);
		
		for(FeedDTO oneResult: resultList) {
			System.out.println("썸네일 :"+oneResult.getUserFwer());
			System.out.println("타이틀 :"+oneResult.getUserFing());
			System.out.println("좋아요숫자 :"+oneResult.getUserNickname());
			System.out.println("글번호 :"+oneResult.getUserProfile());
			System.out.println("유저아이디 :"+oneResult.getUserId());
			System.out.println("유저닉네임 :"+oneResult.getUserName());
		}
		return null;
	}

}


