package com.pictory.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;


import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.service.impl.MemberServiceImpl;

@SessionAttributes("userId")
@Controller
@RequestMapping("/member")
public class MemberController<T> {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("Join.do")
	public String join() {	
		return "member/Join.tiles";
	}
	@RequestMapping(value="kakaoLogin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session, Map map, MemberDTO dto) throws Exception {
		
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
		model.addAttribute("nickname",userInfo.get("userNickname"));
		
		session.setAttribute("access_token", access_Token);
		
		
		return memberService.kakaoLogIn(model, userInfo);
	}
	
	@RequestMapping(value="kakaounlink.do")
	public String unlink(HttpSession session) {
		memberService.unlink((String)session.getAttribute("access_token"));
		session.invalidate();
		return "redirect:/";
	}

	
	@GetMapping(value="IdCheck.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String idCheck(@RequestParam String userId) {
		
		
		boolean isExist = memberService.isExist(userId);
		return String.format("{\"isDuplicated\":\"%s\"}", isExist);
	}
	/////////회원가입
	
	@RequestMapping(value="Insert.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String insert(MemberDTO dto, HttpServletRequest request) throws IOException {
		int mem = 0;
		mem = memberService.signUp(dto);
		if(mem!=0) {
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "/springapp/index.do");
		}
		else if (mem==0) {
			request.setAttribute("msg", "아이디 혹은 이메일 중복확인을 해주세요.");
			request.setAttribute("url", "/springapp/member/Join.do");
			
		}
		return "member/alert.tiles";
	}

}
