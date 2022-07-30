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
import com.pictory.springapp.dto.AdminMainService;
import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminNoticeService;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminPaymentService;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminQnaService;
import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;

@Controller
@RequestMapping("/admin")
public class AdminContorller {
	
	@Autowired
	private AdminMainService mainService;
	
	@Autowired
	private AdminUsersService usersService;
	
	@Autowired
	private AdminGalleryService galleryService;
	
	@Autowired
	private AdminNoticeService noticeService;
	
	@Autowired
	private AdminQnaService qnaService;
	
	@Autowired
	private AdminPaymentService paymentService;
	
	
	@RequestMapping("/Index.do")
	public String adminMain() {
		return "admin/Index";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/mainPaymentChart.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainPaymentChart(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
	
			List<AdminPaymentDTO> list = mainService.adminPaymentChart(params);
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/mainUsersChart.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainUsersChart(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			
			List<AdminUsersDTO> list = mainService.adminUsersChart(params);
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/mainGalleryChart.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainGalleryChart(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			
			List<AdminGalleryDTO> list = mainService.adminGalleryChart(params);
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
//========================================= 차트 END ===================================================================
	@ResponseBody
	@RequestMapping(value="/mainPaymentList.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainPaymentList() throws Exception {
		
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			
			List<AdminPaymentDTO> list = mainService.adminPaymentList();
			jsonStr = obj.writeValueAsString(list);				
			return jsonStr;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/mainNoticeList.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainNoticeList() throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
		
			List<AdminNoticeDTO> list = mainService.adminNoticeList();
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/mainQnaList.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainQnaList() throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
			
			List<AdminQnaDTO> list = mainService.adminQnaList();
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
//========================================================== 메인 END ===========================================================================	
	
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
	@RequestMapping(value="/userChart.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String userChart(@RequestBody List<HashMap<String, Object>> map) throws Exception{
		try {
			
			ObjectMapper obj = new  ObjectMapper();
			String jsonStr = "";	
			List<AdminUsersDTO> list = usersService.usersChart(map);
			jsonStr = obj.writeValueAsString(list);
			return jsonStr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return null;
	}
	
	
//============================================ 회원 END =================================================================	
	
	@ResponseBody
	@RequestMapping(value="/galleryChart.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String gallery(@RequestBody List<HashMap<String, Object>>   param) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
		
			List<AdminGalleryDTO> list = galleryService.gelleryChart(param);
			
			jsonStr = obj.writeValueAsString(list);
			
			return jsonStr;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	

//======================================= 수익 및 정산 ========================================================================	
	
	@RequestMapping("/manager/Index")
	public String managerIndex() {
		return "admin/manager/Index";
	}
	
	@ResponseBody
	@RequestMapping(value="/paymentList.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String paymentList() throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
			
			List<AdminPaymentDTO> list = paymentService.paymentList();
			jsonStr = obj.writeValueAsString(list);			
			return jsonStr;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/paymentSearch.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String paymentSearch(@RequestBody HashMap<String, Object> params) throws Exception {
		try {
			
			System.out.println("params : " + params);
			
			ObjectMapper obj = new ObjectMapper();
			String jsonStr = "";
			
			List<AdminPaymentDTO> list = paymentService.paymentSearch(params);
			jsonStr = obj.writeValueAsString(list);
			
			return jsonStr;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/paymentChart.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String paymentChart(@RequestBody List<HashMap<String, Object>>   params) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
			
			List<AdminPaymentDTO> list = paymentService.paymentChart(params);
			jsonStr = obj.writeValueAsString(list);
			
			return jsonStr;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
//===========================================================================================================================
	
	
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
