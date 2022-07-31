package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.SavePostDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageSaveController {

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("Save.do")
	public String save(HttpSession session, Model model) {
		System.out.println("마이페이지 저장소 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectLikePost(member.getUserNo());
		model.addAttribute("likePostList", dto);
		
		return "mypage/MypageSave.tiles";
	}
	
	@RequestMapping("Buy.do")
	public String buy(HttpSession session, Model model) {
		System.out.println("마이페이지 저장소 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectLikePost(member.getUserNo());
		model.addAttribute("likePostList", dto);
		
		return "mypage/MypageSave.tiles";
	}

}
