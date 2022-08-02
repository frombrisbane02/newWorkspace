package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface FaqService {
	public boolean faqSave(List<HashMap<String, Object>> params) throws Exception;
}

