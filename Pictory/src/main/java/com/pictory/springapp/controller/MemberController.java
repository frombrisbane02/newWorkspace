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
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.pictory.springapp.config.FormCommand;
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
	public String join(FormCommand cmd,BindingResult errors,Model model) {	
		model.addAttribute("name",cmd.getUserName());		

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

	///아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="IdCheck.do", method= RequestMethod.GET, produces = "application/json;charset=UTF-8")
	public int emailCheck(@RequestParam(value="userId", required=false) String userId) throws JsonProcessingException{
		int isExist = memberService.isExist(userId);
		return isExist;
	}
	///이메일 중복 체크
		@ResponseBody
		@RequestMapping(value="emailCheck.do", method= RequestMethod.GET, produces = "application/json;charset=UTF-8")
		public int idCheck(@RequestParam(value="userEmail", required=false) String userEmail) throws JsonProcessingException{
			int isExist = memberService.isExist2(userEmail);
			return isExist;
		}
	/////////회원가입
	@RequestMapping("/Validation.do")
	public String exec(FormCommand cmd, Model model) {
		if(!validated(cmd,model)) {
			return "member/Join.tiles";
		}
		return "forward:/member/Insert.do";
	}
	/////유효성 검사
	private boolean validated(FormCommand cmd, Model model) {
		if(cmd.getUserId().trim().length()==0) {
			model.addAttribute("idError", "아이디를 입력하세요");
			return false;
		}
		if(cmd.getUserName().trim().length()==0) {
			model.addAttribute("nameError", "이름을 입력하세요");
			return false;
		}
		if(cmd.getUserEmail().trim().length()==0) {
			model.addAttribute("emailError", "이메일을 입력하세요");
			return false;
		}
		if(cmd.getUserPassword().trim().length()==0) {
			model.addAttribute("passwordError", "비밀번호를 입력하세요");
			return false;
		}
		if(cmd.getPassword2().trim().length()==0) {
			model.addAttribute("password1Error", "비밀번호를 재입력 해주세요");
			return false;}
		if(!cmd.getPassword2().equals(cmd.getUserPassword())) {
			model.addAttribute("password2Error", "비밀번호가 일치하지 않습니다");
			return false;
		}
		return true;
	}
	
	@RequestMapping(value="Insert.do", method= RequestMethod.POST, produces="application/json;charset=UTF-8")
	public String insert(MemberDTO dto, HttpServletRequest request, Model model) throws IOException {
		
		int mem = 0;
		mem = memberService.signUp(dto);
		if(mem!=0) {
			request.setAttribute("msg", "회원가입이 완료되었습니다.");
			request.setAttribute("url", "/springapp/auth/Login.do");
			
		}
		else if (mem==0) {
			request.setAttribute("msg", "아이디와 이메일 중복확인을 하세요.");
			request.setAttribute("url", "/springapp/member/Join.do");
			
		}
		
		return "member/alert.tiles";

	}

}
