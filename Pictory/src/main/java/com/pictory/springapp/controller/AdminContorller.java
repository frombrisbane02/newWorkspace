package com.pictory.springapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminGalleryService;
import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Controller
@RequestMapping("/admin")
public class AdminContorller {
	
	@Autowired
	private AdminUsersService usersService;
	
	@Autowired
	private AdminGalleryService galleryService;
	
	@RequestMapping("/Index.do")
	public String adminMain() {		
		return "admin/Index";
	}
	
	
	@RequestMapping("/analysis/Index.do")
	public String anysisIndex() {		
		return "admin/analysis/Index";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/userData.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainData(@RequestParam("userNo") int userNo, @RequestParam("enabled") int enabled, @RequestParam("userId") String userId) throws Exception {
			
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			if(userNo == 0 && enabled == 0 && userId == "" ) {
				List<AdminUsersDTO> users = usersService.getUserList();
				jsonStr = obj.writeValueAsString(users);
				
				return jsonStr;
				
			} else if(userId != "") {
				
				String userName = userId;
				String userNickname = userId;
				
				AdminUsersDTO s = new AdminUsersDTO();
				s.setUserId(userId);
				s.setUserName(userName);
				s.setUserNickname(userNickname);
				
				List<AdminUsersDTO> sUser = usersService.searchList(s);
				jsonStr = obj.writeValueAsString(sUser);			
				return jsonStr;
				
			}else if(userNo != 0 && enabled != 0){
				AdminUsersDTO params = new AdminUsersDTO();
				params.setUserNo(userNo);
				params.setEnabled(enabled);
				usersService.updateEnabled(params);
				List<AdminUsersDTO> users1 = usersService.getUserList();
				jsonStr = obj.writeValueAsString(users1);				
				return jsonStr;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return null;
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="/gallery.do", method = { RequestMethod.POST })
	public String gallery(@RequestParam("today") String today ) throws Exception {
		
		System.out.println("갤러리 확인 : " + today);
		
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		AdminGalleryDTO param = new AdminGalleryDTO();
		param.setDateDay(today);
		
		//밑으로 옮김(잠시 주석처리함)
		List<AdminGalleryDTO> ss= AdminGalleryService.galleryList(param);
	
		try {
			
			jsonStr = obj.writeValueAsString(ss);
			
			System.out.println("jsonStr : " + jsonStr);
			
			return jsonStr;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	*/
	@RequestMapping("/manager/Index")
	public String managerIndex() {
		return "admin/manager/Index";
	}
	
	@RequestMapping("/notice/Index")
	public String noticeIndex() {
		return "admin/notice/Index";
	}
	
	
	// 테스트
	@RequestMapping("/test.do")
	public String test() {		
		return "admin/test";
	}

	
}
