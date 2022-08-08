package com.pictory.springapp.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.SearchDTO;
import com.pictory.springapp.dto.SearchService;
import com.pictory.springapp.service.impl.SearchServiceImpl;

@Controller
@RequestMapping("/search")
public class SearchController {
    @Resource(name = "searchService")
    private SearchServiceImpl searchService;
	@RequestMapping(value="Search.do",produces = "application/json;charset=UTF-8")
	public String search(@RequestParam Map map,Model model) {
		if(map.get("searchName") !=null) {
			System.out.println("컨트롤러 서치네임"+map.get("searchName"));
			System.out.println("검색 컨트롤러");
			//서비스 호출
			List<SearchDTO> lists= searchService.searchSelect(map);
			List<SearchDTO> hashs = searchService.hashList();
			//List<SearchDTO> categorys = searchService.categorySelect(map);
			for(SearchDTO oneResult : lists) {
				System.out.println("컨트롤러 for문 입장");
				System.out.println("컨트롤러postno"+ oneResult.getPostNo());
				System.out.println("컨트롤러userNickname"+ oneResult.getUserNickname());
				
				}
			System.out.println("##################search컨트롤러lists############:"+lists);
			model.addAttribute("lists",lists);
			model.addAttribute("hashs",hashs);
			System.out.println("##hash##:"+hashs);
			//model.addAttribute("categorys",categorys);
		}
		/*
		 * List<SearchDTO> categorys = searchService.categorySelect(map);
		 * System.out.println("컨트롤러 다시 돌아왔니??");
		 * System.out.println("###categorys###:"+categorys);
		 * model.addAttribute("categorys", categorys);
		 */
		
		
		
		return "search/SearchView";
		
		
	};
	
	@ResponseBody
	@RequestMapping(value="Category.do",produces = "application/json;charset=UTF-8")
	public String postCategory(@RequestParam Map map,Model model,@RequestParam("postCategory")String postCategory) {
		if(map.get("postCategory") != null) {
			System.out.println("카테고리명"+map.get("postCategory"));
			//서비스 호출
			List<SearchDTO> categorys = searchService.categorySelect(map);
			for(SearchDTO category : categorys) {
				System.out.println("컨트롤러 카테고리"+category.getPostNo());
				
			}
			model.addAttribute("categorys",categorys);
		}
		
		return "search/SearchView";
	};
	
	
	
	
	
	
	
//	//카테고리로 검색결과 가져오기
//	public String selectMenu(String[] postCategory, Model model) {
//		String select = postCategory[0];
//		for(int i =1; i < postCategory.length; i++) {
//			System.out.println(postCategory[i]);
//			select += "," + postCategory[i];
//		}
//		model.addAttribute("postCategory",select);
//		return "search/SearchView";
//	}
	/*
	 * @GetMapping("Search.do") public String SearchView(Model
	 * model, @RequestParam("postCategory")String postCategory, Map map) {
	 * 
	 * System.out.println("====ajax view반환====");
	 * System.out.println("클릭한 postCategory:"+postCategory);
	 * 
	 * Map postCategorymenu = new HashMap<>(); postCategorymenu.put("postCategory",
	 * postCategorymenu);
	 * 
	 * //1. photoUrl 먼저 가져오기 List<SearchDTO> photoLists =
	 * searchService.searchCategory(postCategorymenu); SearchDTO[] lists = null;
	 * for(SearchDTO oneResult : lists) { System.out.println("컨트롤러 postUrls:"+
	 * oneResult.getPhotoUrl()); String resource = null;
	 * oneResult.setPhotoUrl(resource+oneResult.getPhotoUrl()); }
	 * 
	 * 
	 * return "search/SearchView"; }
	 */
	
	
	
	
	
	
}
