package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminNoticeService {
	
	List<AdminNoticeDTO> getNoticeList(HashMap<String, Object> params) throws Exception;
	
	boolean getNoticeInsert(List<HashMap<String, Object>> map) throws Exception;
	
	boolean getNoticeUpdate(HashMap<String, Object> map) throws Exception;
	
	boolean getNoticeDelete(int map) throws Exception;
	
	// 총 토탈 갯수
	int getNoticeTotalCount(HashMap<String, Object> params) throws Exception;
	
	// 검색 토탈 갯수
//	int getNoticeSearchTotalCount(HashMap<String, Object> params) throws Exception;
}
