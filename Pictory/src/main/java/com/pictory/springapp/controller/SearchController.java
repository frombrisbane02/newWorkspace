package com.pictory.springapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.SearchDTO;
import com.pictory.springapp.dto.SearchService;
import com.pictory.springapp.service.impl.SearchServiceImpl;

@SessionAttributes("userId")
@SuppressWarnings("unused")
@Controller
@RequestMapping("/search")
public class SearchController {
	
//	@Autowired
//	private SearchService<SearchDTO> searchService;
	
	@Autowired
	ObjectMapper objectMapper;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
		
	//통합 검색
    @Resource(name = "searchService")
    private SearchServiceImpl searchService;
	@RequestMapping(value="Search.do",produces = "application/json;charset=UTF-8")
	public String search(@RequestParam Map map,Model model, @ModelAttribute("userId") String userId) {
		if(map.get("searchName") !=null) {
			//서비스 호출
			List<SearchDTO> lists= searchService.searchSelect(map);
			List<SearchDTO> hashs = searchService.hashList();
			//List<SearchDTO> categorys = searchService.categorySelect(map);
//			for(SearchDTO oneResult : lists) {
//				
//				}
			model.addAttribute("lists",lists);
			model.addAttribute("hashs",hashs);
		}
		
		return "search/SearchView.tiles";
	};
	
   //좋아요 누르기
   @CrossOrigin
   @RequestMapping(value="search/Likes.do",produces = "application/json;charset=UTF-8")
   @ResponseBody 
   public int likes(@RequestParam(value="userId", required=false) String userId,
                           @RequestParam(value="postNo", required=false) int postNo,
                           HttpSession session, Model model,
                           HttpServletRequest req) throws JsonProcessingException{
 
    
      int like = searchService.searchLike(postNo, userId);
      if(like>=1) {
    	  searchService.searchlikeDown(postNo, userId);
      }
      else {
    	  searchService.searchlikeUp(postNo,userId);

      }
      int getsearchlikes = searchService.getsearchlikes(postNo);
      return getsearchlikes;
   }
	
	
	//카트에 담기
	@CrossOrigin
	   @RequestMapping(value="search/CartInList.do",produces = "application/json;charset=UTF-8")
	   @ResponseBody
		public String CartInList(Model model,@RequestParam("postNo") int postNo, @ModelAttribute("userId") String userId) {
			
		   Map map = new HashMap();
		   map.put("userId", userId);
		   map.put("postNo", postNo);
		   
		   //1) 카트에 상품 있는지 check
		   int isCartedList = searchService.findCartinList(map);
		   
		   //1.1) pdNo 알아오기
		   int pdNo = searchService.findPdNo(map);
		   map.put("pdNo", pdNo);
		   
		   //2) 1이면 DELETE 0이면 INSERT
		   if(isCartedList>=1) {searchService.deleteCart(map);}
		   else{searchService.insertCart(map);}
			
			return "{\"cart\":\"sucsses\"}";
		}
	
   
  
   
   
   
}
