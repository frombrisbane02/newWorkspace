package com.pictory.springapp.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MypageAlertController {
	
	@RequestMapping("Alert.do")
	public String alert() {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		return "mypage/MypageAlert.tiles";
	}
}
