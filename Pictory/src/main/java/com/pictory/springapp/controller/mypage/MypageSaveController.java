package com.pictory.springapp.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MypageSaveController {

	@RequestMapping("Save.do")
	public String save() {
		System.out.println("마이페이지 저장소 컨트롤러");
		
		return "mypage/MypageSave.tiles";
	}

}
