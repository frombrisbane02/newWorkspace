package com.pictory.springapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;


import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/member")
public class MemberController<T> {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@RequestMapping("Join.do")
	public String join() {	
		return "member/Join.tiles";
	}
	
	/*<유효성 검사>*/
	/*@RequestMapping("SignInProcess.do")
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
	}*/
	
	@GetMapping(value="IdCheck.do", produces="application/json;charset=UTF-8")
	public @ResponseBody String idCheck(@RequestParam String userId) {
		
		
		boolean isExist = memberService.isExist(userId);
		System.out.println("sdkfljasldkfjaslkdfjalksjdflkasjdflkasjdlkfjl");
		return String.format("{\"isDuplicated\":\"%s\"}", isExist);
	}
	/////////회원가입
	
	@RequestMapping(value="Insert.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String insert(MemberDTO dto, HttpServletRequest request) throws IOException {
		System.out.println("회원가입 컨트롤러");
		int mem = 0;
		mem = memberService.signUp(dto);
		if(mem!=0) {
			System.out.println("성공mem:"+mem);
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "/springapp/index.do");
		}
		else if (mem==0) {
			System.out.println("mem:"+mem);
			request.setAttribute("msg", "아이디 혹은 이메일 중복확인을 해주세요.");
			request.setAttribute("url", "/springapp/member/Join.do");
			
		}
		return "member/alert.tiles";
	}

}
