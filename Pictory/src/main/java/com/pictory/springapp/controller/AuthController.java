package com.pictory.springapp.controller;

import java.util.Map;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.pictory.springapp.service.impl.MemberServiceImpl;

@SessionAttributes({"userId"})
@Controller
@RequestMapping("/auth")
public class AuthController {
	/*
	//@Resource(name = "memberService")
	//private MemberServiceImpl memberService;
	
	@RequestMapping("Login.do")
	public String login() {
		System.out.println("濡쒓렇�씤 而⑦듃濡ㅻ윭");
		return "auth/Login.tiles";
	}
	//濡쒓렇�씤 泥섎━]
	@RequestMapping("LoginProcess.do")
	public String process(@RequestParam Map map, Model model, SessionStatus status) {
		//�꽌鍮꾩뒪 �샇異�]
		boolean flag = memberService.isLogin(map);
		System.out.println("@@@@@LoginProcess.do@@@:"+flag);
		
		model.addAttribute("userId",map.get("userId"));
		if(!flag) {
			status.setComplete();
			model.addAttribute("NotMember","�븘�씠�뵒�� 鍮꾨쾲 遺덉씪移�");
		}
		return "auth/Login.tiles";
	}
	
*/
	@RequestMapping("Logout.do")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "auth/Login.tiles";
	}

}