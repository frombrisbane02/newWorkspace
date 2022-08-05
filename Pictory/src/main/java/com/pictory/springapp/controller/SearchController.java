package com.pictory.springapp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.dto.SearchDTO;
import com.pictory.springapp.service.impl.SearchServiceImpl;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Resource(name = "searchService")
    private SearchServiceImpl searchService;
	@RequestMapping("Search.do")
	public String search(@RequestParam Map map,Model model) {
		if(map.get("searchName") !=null) {
			System.out.println("컨트롤러 서치네임"+map.get("searchName"));
			System.out.println("검색 컨트롤러");
			//서비스 호출
			List<SearchDTO> lists= searchService.searchSelect(map);
			List<SearchDTO> hashs = searchService.hashList();
			//List<SearchDTO> categorys = searchService.categorySelect();
			for(SearchDTO oneResult : lists) {
				System.out.println("컨트롤러 for문 입장");
				System.out.println("컨트롤러postno"+ oneResult.getPostNo());
				System.out.println("컨트롤러userNickname"+ oneResult.getUserNickname());
				
				}
			System.out.println("##################search컨트롤러lists############:"+lists);
			model.addAttribute("lists",lists);
			model.addAttribute("hashs",hashs);
			//model.addAttribute("categorys",categorys);
		}
		
		return "search/SearchView";
	}
	
//	public String selectMenu(@RequestParam Map map, Model model) {
//		String select = map[0];
//		
//		
//		return "search/SearchView";
//	}
	
}
