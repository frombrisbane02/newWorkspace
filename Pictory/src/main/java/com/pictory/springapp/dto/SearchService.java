package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface SearchService<T> {
	//조회(검색)
	List<SearchDTO> searchSelect(Map map);
}
