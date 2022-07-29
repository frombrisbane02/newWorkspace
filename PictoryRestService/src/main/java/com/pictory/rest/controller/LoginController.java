package com.pictory.rest.controller;

import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.pictory.rest.service.UsersDTO;
import com.pictory.rest.service.impl.LoginService;


@RestControllerAdvice
@RestController
public class LoginController {
	
	@Autowired(required = false)
	private LoginService loginService;
	
	//로그인
	@PostMapping("/users/login")
	public Map<String, String> login(UsersDTO dto) {
		return loginService.login(dto);
	}
	
	//카카오 로그인
	@PostMapping("/users/kakaoLogin")
	public Map<String, String> kakaoLogin(@RequestParam Map<String, String> map) {
		return loginService.kakaoLogin(map);
	}
	
	
	
	
	
}
