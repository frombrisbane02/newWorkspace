package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.dto.AlarmDTO;
import com.pictory.springapp.dto.AlarmService;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@Controller
@RequestMapping("/mypage/")
public class MypageAlertController {
	
	@Autowired private AlarmService alarmService;
	@Autowired private MemberService memberService;
	
	@RequestMapping("Alert.do")
	public String alert(HttpSession session, Model model) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		
		List<AlarmDTO> list = alarmService.selectAlram(id);
		model.addAttribute("alarmList", list);
		
		return "mypage/MypageAlert.tiles";
	}
	
	@RequestMapping(value = "UpdateAlert.do", method = RequestMethod.POST)
	public String updateAlert(HttpSession session, Model model, @RequestParam(value="alarmNo") Integer alarmNo) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		
		String id = (String) session.getAttribute("userId");
		
		alarmService.updateAlarm(alarmNo, id);
		List<AlarmDTO> list = this.alarmService.selectAlram(id);
		model.addAttribute("alarmList", list);
		
		
		return "redirect:/mypage/Alert.do";
	}
	
	
}
