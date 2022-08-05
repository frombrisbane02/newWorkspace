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
		return dao.searchSelect(map);		
	}

	public List<SearchDTO> hashList() {
		//해시태그 가져오기
		return dao.getHashList();
	}

	//public List<SearchDTO> categorySelect() {
		// 카테고리 가져오기
	//	return dao.getCategoryList();
	//}

}
