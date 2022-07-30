package com.pictory.springapp.controller.feed;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/feed/")
public class FeedController {

	
	
	@RequestMapping("Index.do")
	public String index() {
		System.out.println("피드 페이지");
	
		return "feed/Index.tiles";
	}
	


	
	

	


}