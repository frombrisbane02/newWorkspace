package com.pictory.springapp.controller.feed;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.FeedService;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;
import com.pictory.springapp.service.impl.FeedServiceImpl;





@Controller
@RequestMapping("/feed/")
public class FeedController {
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	
	
	@Autowired
	private FeedService service;
	

	
	@RequestMapping(value = "Index.do", method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception{
		

		//세션 객체 안에 있는 ID정보 저장
		String id = (String) session.getAttribute("userId");
		
		//서비스안의 회원정보보기 메서드 호출
		FeedDTO dto = service.feedInfo(id);
		
		//정보저장 후 페이지 이동
		model.addAttribute("feedInfo",dto);
		
		System.out.println("아아"+session.getAttribute("userId"));
	}

	
	@GetMapping("FeedIndex.do")
	public String galleryList2(Model model, @RequestParam(value="userNo") int userNo) {
		
		//타인 댓글 프사 클릭시 userNo 받아서 피드 index 이동
		FeedDTO dto = service.feedInfoOther(userNo);
		dto.setUserProfile(resource+dto.getUserProfile());
		model.addAttribute("feedInfo",dto);
		
		return "feed/Index.tiles";
		
	}
	
	
	
	

	


}