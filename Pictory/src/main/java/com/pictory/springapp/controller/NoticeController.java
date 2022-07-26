package com.pictory.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	@RequestMapping("Index.do")
	public String noticeIndex() {		
		return "notice/Index.tiles";
	}

}
