package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminQnaService {
	List<AdminQnaDTO> qnaList(HashMap<String, Object> map) throws Exception;
	boolean qnaAnswer(List<HashMap<String, Object>> params) throws Exception;
	boolean qnaAnswerUpdate(List<HashMap<String, Object>> params) throws Exception;
	boolean qnaDelete(int qnaNo) throws Exception;
}
