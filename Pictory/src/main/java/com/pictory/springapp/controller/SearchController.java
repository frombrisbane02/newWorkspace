package com.pictory.springapp.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.dto.SearchService;
import com.pictory.springapp.service.impl.SearchServiceImpl;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Resource(name = "searchService")
    private SearchServiceImpl searchService;
	@RequestMapping("Search.do")
	public String search(@RequestParam Map map) {
		System.out.println(map.get("searchName"));
		System.out.println("검색 컨트롤러");
		//서비스 호출
		searchService.searchSelect(map);
		return "search/Search.tiles";
	}

}
