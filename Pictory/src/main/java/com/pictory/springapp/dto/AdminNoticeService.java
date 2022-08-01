package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminNoticeService {
	List<AdminNoticeDTO> getNoticeList(HashMap<String, Object> map) throws Exception;
	boolean getNoticeInsert(List<HashMap<String, Object>> map) throws Exception;
	boolean getNoticeUpdate(HashMap<String, Object> map) throws Exception;
	boolean getNoticeDelete(int map) throws Exception;
}
