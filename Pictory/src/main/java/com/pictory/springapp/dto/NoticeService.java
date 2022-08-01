package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;




public interface NoticeService<T> {
	
	List<T> noticeSelectList(Map map);
	
	T selectOne(Map map);
	
}

