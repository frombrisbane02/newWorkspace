package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface AdminQnaService {
	List<AdminQnaDTO> qnaList(HashMap<String, Object> map) throws Exception;
	boolean qnaAnswer(List<HashMap<String, Object>> params) throws Exception;
	boolean qnaAnswerUpdate(List<HashMap<String, Object>> params) throws Exception;
	boolean qnaDelete(int qnaNo) throws Exception;
	
	// 카운트
	int qnaTotalCount(HashMap<String, Object> params) throws Exception;
	void alarmInsert(Map map);
}
