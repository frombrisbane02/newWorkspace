package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.SearchDTO;
import com.pictory.springapp.dto.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService<SearchDTO> {
	@Autowired
	private SearchDAO dao;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	
	@Override
	public List<SearchDTO> searchSelect(Map map) {
		List<SearchDTO> succ = dao.searchSelect(map);
		//System.out.println("서비스로 돌아왔어요");
		return succ;		
	}

	public List<SearchDTO> hashList() {
		//해시태그 가져오기
		return dao.getHashList();
	}
	//카테고리 메뉴 가져오기
//	public List<SearchDTO> categorySelect(String postCategory) {
//		List<SearchDTO> menu= dao.categorySelect(postCategory);
//		//System.out.println("너 돌아왔니??");
//		return menu;
//	}

	

	@Override
	public int findCartinList(Map map) {
		return dao.findCartinList(map);
	}

	@Override
	public int findPdNo(Map map) {
		return dao.findPdNo(map);
	}

	@Override
	public void deleteCart(Map map) {
		dao.deleteCart(map);
		
	}

	@Override
	public void insertCart(Map map) {
		dao.insertCart(map);
		
	}

	@Override
	public Integer searchLike(int postNo, String userId) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		int counts= dao.searchLike(map);
		return counts;
	}

	@Override
	public void searchlikeDown(int postNo, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		
		//alarm 테이블 delete 여기서 했어여!
		map.put("alarmType", "좋아요");
		dao.deleteSearchLikeAlarm(map);
		
		dao.searchlikeDown(map);
	}

	@Override
	public void searchlikeUp(int postNo, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		
		dao.searchlikeUp(map);		
		map.put("alarmType", "좋아요");
		dao.insertSearchLikeAlarm(map);
	}

	@Override
	public Integer getsearchlikes(int postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		return dao.getsearchlikes(map);
	}
	
	


	

	

}
