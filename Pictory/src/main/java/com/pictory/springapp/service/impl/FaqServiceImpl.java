package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.FaqService;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDAO faqDAO;

	@Override
	public boolean faqSave(List<HashMap<String, Object>> params) throws Exception {
			try {
				
				boolean result = faqDAO.faqSave(params);
				return result;
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		
		return false;
	}

	
	

}
