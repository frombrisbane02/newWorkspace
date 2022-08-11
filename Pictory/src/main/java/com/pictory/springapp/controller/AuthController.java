package com.pictory.springapp.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.service.impl.MemberServiceImpl;

@SessionAttributes({"userId"})
@Controller
@RequestMapping("/auth")
public class AuthController {
	//서비스 주입
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("JoinAgree.do")
	public String joinagree() {
		return "auth/JoinAgree.tiles";
	}
	////////
	@RequestMapping("Login.do")
	public String login() {
		return "auth/Login.tiles";
	}
	//로그인 처리] 
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map, Model model, SessionStatus status) {
		//서비스 호출]
		String flag = memberService.isLogin(map);
				
		if(flag==null) {
		status.setComplete();
		model.addAttribute("NotMember","아이디와 비번 불일치");
		return "auth/Login.tiles";
		}
		
		if(flag.equals("ADMIN")) {
			model.addAttribute("userId",map.get("userId"));
			return "admin/Index";
		
		}
		
		else if(flag.equals("USER")) {
			model.addAttribute("userId",map.get("userId"));			
		}
		
		return "auth/Login.tiles";
	}
	//로그아웃 처리]
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		
		return "auth/Login.tiles";
	}
	

}