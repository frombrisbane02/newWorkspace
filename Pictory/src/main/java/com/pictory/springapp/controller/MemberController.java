package com.pictory.springapp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;


import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController<T> {
	
	@Autowired
	private MemberService<T> memberService;
	
	@RequestMapping("Join.do")
	public String join() {	
		return "member/Join.tiles";
	}
	
	
	@RequestMapping("SignInProcess.do")
	public String signinprocess(MemberDTO dto, Model model) {
		System.out.println("DDDDDDD");
		model.addAttribute("userName", dto.getUserName());
		if(!validate(dto,model)) {
			
			
			return "member/Join.tiles";
		}
		return "member/Join.tiles";
	}
	private boolean validate(MemberDTO dto, Model model) {
		if(dto.getUserName().trim().length()==0) {
			model.addAttribute("nameError", "이름을 입력하세요");
			return false;
		}
		return true;
	}
	
	@GetMapping(value="IdCheck.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String idCheck(@RequestParam String userId) {
		
		
		boolean isExist = memberService.isExist(userId);
		System.out.println("sdkfljasldkfjaslkdfjalksjdflkasjdflkasjdlkfjl");
		return String.format("{\"isDuplicated\":\"%s\"}", isExist);
	}

}
