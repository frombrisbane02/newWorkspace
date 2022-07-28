package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminQnaService {
	List<AdminQnaDTO> qnaList(HashMap<String, Object> map) throws Exception;
	boolean qnaDelete(int qnaNo) throws Exception;
}

