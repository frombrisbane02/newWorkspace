package com.pictory.springapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChatbotController {

	@GetMapping("Chatbot.do")
	public String chatbot() {
		//업로드 버튼 클릭시 업로드1 페이지로 넘겨주기
		return "chatbot/chatbot.tiles";
	}
	
}
