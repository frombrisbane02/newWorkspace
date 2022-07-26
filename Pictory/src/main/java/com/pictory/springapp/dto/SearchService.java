package com.pictory.springapp.dto;

import java.util.Map;

public interface SearchService<T> {
	//조회(검색)
	int select(Map map);
}
