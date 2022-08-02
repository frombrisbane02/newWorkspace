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
	
	@RequestMapping("Like.do")
	public String save(HttpSession session, Model model) {
		System.out.println("마이페이지 내가 좋아요 한 사진 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectLikePost(member.getUserNo());
		System.out.println(dto);
		model.addAttribute("likePostList", dto);
		
		return "mypage/MypageLike.tiles";
	}
	
	@RequestMapping("Buy.do")
	public String buy(HttpSession session, Model model) {
		System.out.println("마이페이지 내가 산 사진 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectBuyPost(member.getUserNo());
		System.out.println(dto);
		model.addAttribute("BuyPostList", dto);
		
		return "mypage/MypageBuy.tiles";
	}

}
