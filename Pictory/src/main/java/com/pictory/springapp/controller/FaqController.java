package com.pictory.springapp.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.dto.FaqService;

@Controller
@RequestMapping("/faq/")
public class FaqController {
	
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping("Index.do")
	public String faqIndex() {
		return "faq/Index.tiles";
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/qnaSave.do", method = {RequestMethod.POST})
	public boolean qnaSave(@RequestBody List<HashMap<String, Object>> params) throws Exception {		
		try {
		//	System.out.println("params" + params);
			
			boolean result = faqService.faqSave(params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	
}
