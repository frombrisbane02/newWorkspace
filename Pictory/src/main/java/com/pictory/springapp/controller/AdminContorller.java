package com.pictory.springapp.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminGalleryService;
import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminNoticeService;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminQnaService;
import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Controller
@RequestMapping("/admin")
public class AdminContorller {
	
	@Autowired
	private AdminUsersService usersService;
	
	@Autowired
	private AdminGalleryService galleryService;
	
	@Autowired
	private AdminNoticeService noticeService;
	
	@Autowired
	private AdminQnaService qnaService;
	
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
	
	@ResponseBody
	@RequestMapping(value="/gallery.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String gallery(@RequestParam("today") String today ) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			
			AdminGalleryDTO param = new AdminGalleryDTO();
			param.setDateDay(today);
			
			List<AdminGalleryDTO> ss = galleryService.galleryList(param);			
			jsonStr = obj.writeValueAsString(ss);
			return jsonStr;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@RequestMapping("/manager/Index")
	public String managerIndex() {
		return "admin/manager/Index";
	}
	
	@RequestMapping("/notice/Index")
	public String noticeIndex() {
		return "admin/notice/Index";
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeList.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String noticeList(@RequestBody HashMap<String, Object> map) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
			
			List<AdminNoticeDTO> list = noticeService.getNoticeList(map);			
			jsonStr = obj.writeValueAsString(list);
			
			return jsonStr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/noticeInsert.do", method = {RequestMethod.POST})
	public boolean noticeInsert(@RequestBody List<HashMap<String, Object>> map ) throws Exception {
		try {
			boolean result = noticeService.getNoticeInsert(map);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeUpdate.do", method = {RequestMethod.POST})
	public boolean noticeUpdate(@RequestBody HashMap<String, Object> map) throws Exception {
		System.out.println("CONTROLLER DATA CHECK : " + map);
		try {
			
			boolean result = noticeService.getNoticeUpdate(map);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	
			return false;
	}
	
	@ResponseBody
	@RequestMapping(value="/noticeDelete.do", method = {RequestMethod.POST})
	public boolean noticeDelete(@RequestParam("noticeNo") int noticeNo) throws Exception {
		try {
			
			boolean result = noticeService.getNoticeDelete(noticeNo);
			return result;
		}catch (Exception e) {
		  e.printStackTrace();
		}
		
			return false;
	}
	
//============================== Q&A====================================================================
	@ResponseBody
	@RequestMapping(value="/qnaList.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String qnaList(@RequestBody HashMap<String, Object> map) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			List<AdminQnaDTO> list = qnaService.qnaList(map);
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaDelete.do", method = {RequestMethod.POST})
	public boolean qnaDelete(@RequestParam("qnaNo") int qnaNo ) throws Exception {
		
		try {
			boolean result = qnaService.qnaDelete(qnaNo);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
