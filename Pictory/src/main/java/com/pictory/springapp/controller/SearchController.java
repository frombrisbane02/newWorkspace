package com.pictory.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {

	@RequestMapping("Search.do")
	public String search() {
		System.out.println("검색 컨트롤러");
		return "search/Search.tiles";
	}

}
