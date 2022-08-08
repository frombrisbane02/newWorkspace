package com.pictory.springapp.service.impl;

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
		System.out.println("서비스로 돌아왔어요");
		return succ;		
	}

	public List<SearchDTO> hashList() {
		//해시태그 가져오기
		return dao.getHashList();
	}
	//카테고리 메뉴 가져오기
	public List<SearchDTO> categorySelect(Map map) {
		List<SearchDTO> menu= dao.categorySelect(map);
		System.out.println("너 돌아왔니??");
		return menu;
	}


	

}
