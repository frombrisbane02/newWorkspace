package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.SearchDTO;
import com.pictory.springapp.dto.SearchService;

@Service("searchService")
public class SearchServiceImpl implements SearchService<SearchDTO> {
	@Autowired
	private SearchDAO dao;
	
	

	@Override
	public List<SearchDTO> searchSelect(Map map) {
		return dao.searchSelect(map);		
	}

}
