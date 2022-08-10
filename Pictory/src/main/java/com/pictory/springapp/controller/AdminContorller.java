package com.pictory.springapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminDTO;
import com.pictory.springapp.dto.AdminGalleryDTO;
import com.pictory.springapp.dto.AdminGalleryService;
import com.pictory.springapp.dto.AdminMainService;
import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminNoticeService;
import com.pictory.springapp.dto.AdminPageMarkerDTO;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.AdminPaymentService;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminQnaService;
import com.pictory.springapp.dto.AdminUsersDTO;
import com.pictory.springapp.dto.AdminUsersService;
import com.pictory.springapp.dto.PageDTO;

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
	public String adminMain() throws Exception {
		return "admin/Index";
	}
	
	
	// 로그인시 로그인한 회원 정보
	@ResponseBody
	@RequestMapping(value="/LoginUserInfo.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8" )
	public String AdminLoginInfo(@RequestParam("userId") String userId) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		
		try {
			
			List<AdminUsersDTO> result = usersService.readMember(userId);
			
			jsonStr = obj.writeValueAsString(result);
			
			return jsonStr;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
			return null;
	}
	

	

	@ResponseBody
	@RequestMapping(value="/salesofweek.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String adminSalesOfWeek(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		ObjectMapper obj = new ObjectMapper();
		String jsonStr = "";
		try {
		
			List<AdminDTO> list = mainService.adminSalesOfWeek(params);

			jsonStr = obj.writeValueAsString(list);
		
			return jsonStr;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
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

	// 회원 리스트 및 정보
	
//	@RequestParam("type") String type,  @RequestParam("userNo") int userNo, @RequestParam("enabled") int enabled, @RequestParam("userId") String userId, @RequestParam("page") int page, @RequestParam("ppp") int ppp
	
	@ResponseBody
	@RequestMapping(value="/userData.do", method = { RequestMethod.POST }, produces="text/plain;charset=UTF-8")
	public String mainData(AdminCriteriaDTO cri, @RequestBody List<HashMap<String, Object>>  params ) throws Exception {
		List<String> listArr = new ArrayList<String>();
		AdminPageMarkerDTO pageMaker = new AdminPageMarkerDTO();
		ObjectMapper obj = new ObjectMapper();
		String jsonStr1 = "";
		String jsonStr2 = "";
		
		try {
		
			String type = (String) params.get(0).get("type");
			
			// 전체
			if( "ALL".equals(type) ) {
				
				int page = (Integer) params.get(0).get("page");
				int ppp = (Integer) params.get(0).get("ppp");
				
				cri.setPage(page);
				cri.setPerPageNum(ppp);
				
				
				params.get(0).put("rowStart", cri.getRowStart());
				params.get(0).put("rowEnd", cri.getRowEnd());
				
				List<AdminUsersDTO> users = usersService.getUserList(params.get(0));
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(usersService.getUsersCount());
				jsonStr1 = obj.writeValueAsString(users);
				jsonStr2 = obj.writeValueAsString(pageMaker);
			
				listArr.add(jsonStr1);
				listArr.add(jsonStr2);
				String reList = listArr.toString();
				
				return reList;
				
			}
			
			// 검색
			if("SEARCH".equals(type)) {
				
				int page = (Integer) params.get(0).get("page");
				int ppp = (Integer) params.get(0).get("ppp");
				
				cri.setPage(page);
				cri.setPerPageNum(ppp);
				
				params.get(0).put("rowStart", cri.getRowStart());
				params.get(0).put("rowEnd", cri.getRowEnd());

				pageMaker.setCri(cri);
				pageMaker.setTotalCount(usersService.getSearchUsersCount(params.get(0)));
				List<AdminUsersDTO> sUser = usersService.searchList(params.get(0));
				
				jsonStr1 = obj.writeValueAsString(sUser);
				jsonStr2 = obj.writeValueAsString(pageMaker);
			
				listArr.add(jsonStr1);
				listArr.add(jsonStr2);
				String reList = listArr.toString();
				
				return reList;
				
			}
			
			// 업데이트
			if("UPDATE".equals(type)){

				usersService.updateEnabled(params.get(0));
			
				int page = (Integer) params.get(0).get("page");
				int ppp = (Integer) params.get(0).get("ppp");
				
				cri.setPage(page);
				cri.setPerPageNum(ppp);	
				
				params.get(0).put("rowStart", cri.getRowStart());
				params.get(0).put("rowEnd", cri.getRowEnd());

				pageMaker.setCri(cri);
				pageMaker.setTotalCount(usersService.getSearchUsersCount(params.get(0)));
				
				List<AdminUsersDTO> users1 = usersService.getUserList(params.get(0));
			
				jsonStr1 = obj.writeValueAsString(users1);
				jsonStr2 = obj.writeValueAsString(pageMaker);
			
				listArr.add(jsonStr1);
				listArr.add(jsonStr2);
				String reList = listArr.toString();
				
				return reList;
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
	public String managerIndex(PageDTO pageDTO, Model model) throws Exception {
//		int totalCount = paymentService.totalCount();
//		String keyword = pageDTO.getKeyword();
//		int pageNum = pageDTO.getPageNum();
//		pageDTO = new PageDTO(pageNum, totalCount, keyword);		
//		model.addAttribute("pageDTO", pageDTO);
		
		
		return "admin/manager/Index";
	}
	
	// 수익 및 정산 => 최근 거래내역 LIST
	@ResponseBody
	@RequestMapping(value="/paymentList.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String paymentList(AdminCriteriaDTO cri,@RequestBody List<HashMap<String, Object>>  params) throws Exception {
		
		List<String> listArr = new ArrayList<String>();
		AdminPageMarkerDTO pageMaker = new AdminPageMarkerDTO();
		ObjectMapper obj = new ObjectMapper();
		String jsonStr1 = "";
		String jsonStr2 = "";
		try {
			
			
			int page = (Integer) params.get(0).get("page");
			int ppp = (Integer) params.get(0).get("ppp");
			
			cri.setPage(page);
			cri.setPerPageNum(ppp);
			
			List<AdminPaymentDTO> list = paymentService.paymentList(cri);
		
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(paymentService.paymentTotalCount());

			jsonStr1 = obj.writeValueAsString(list);
			jsonStr2 = obj.writeValueAsString(pageMaker);

			listArr.add(jsonStr1);
			listArr.add(jsonStr2);
		
			String relist = listArr.toString();
			
			return relist;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	// 최근구매 / 판매 목록 검색
	@ResponseBody
	@RequestMapping(value="/paymentSearch.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String paymentSearch(AdminCriteriaDTO cri, @RequestBody List<HashMap<String, Object>> params) throws Exception {
		
		List<String> listArr = new ArrayList<String>();
		AdminPageMarkerDTO pageMaker = new AdminPageMarkerDTO();
		ObjectMapper obj = new ObjectMapper();
		String jsonStr1 = "";
		String jsonStr2 = "";
	
		try {
			
			int page = (Integer) params.get(0).get("page");
			int ppp = (Integer) params.get(0).get("ppp");
			
			cri.setPage(page);
			cri.setPerPageNum(ppp);
			
			params.get(0).put("rowStart", cri.getRowStart());
			params.get(0).put("rowEnd", cri.getRowEnd());
			
			
			if("ALL".equals(params.get(0).get("choiceValue"))) {
				List<AdminPaymentDTO> list = paymentService.paymentList(cri);
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(paymentService.paymentTotalCount());
				
				jsonStr1 = obj.writeValueAsString(list);
				jsonStr2 = obj.writeValueAsString(pageMaker);
				
			} else {
				List<AdminPaymentDTO> list = paymentService.paymentSearch(params.get(0));
				pageMaker.setCri(cri);
				pageMaker.setTotalCount(paymentService.paymentSearchCount(params.get(0)));
				
				jsonStr1 = obj.writeValueAsString(list);
				jsonStr2 = obj.writeValueAsString(pageMaker);
			}

			listArr.add(jsonStr1);
			listArr.add(jsonStr2);
			String relist = listArr.toString();
			
			return relist;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		 return null;
	}
	
	// 매출 차트
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
	
	
	// 공지 사항 조회
	@ResponseBody
	@RequestMapping(value="/noticeList.do", method = {RequestMethod.POST}, produces="text/plain;charset=UTF-8")
	public String noticeList(AdminCriteriaDTO cri, @RequestBody List<HashMap<String, Object>> params) throws Exception {
		List<String> listArr = new ArrayList<String>();
		AdminPageMarkerDTO pageMaker = new AdminPageMarkerDTO();
		ObjectMapper obj = new ObjectMapper();
		String jsonStr1 = "";
		String jsonStr2 = "";
		try {
			
			int page = (Integer) params.get(0).get("page");
			int ppp = (Integer) params.get(0).get("ppp");
			
			cri.setPage(page);
			cri.setPerPageNum(ppp);
			
			params.get(0).put("rowStart", cri.getRowStart());
			params.get(0).put("rowEnd", cri.getRowEnd());
			
			List<AdminNoticeDTO> list = noticeService.getNoticeList(params.get(0));
			
			int countResult = noticeService.getNoticeTotalCount(params.get(0));
			
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(countResult);
			
			
			jsonStr1 = obj.writeValueAsString(list);
			jsonStr2 = obj.writeValueAsString(pageMaker);

			listArr.add(jsonStr1);
			listArr.add(jsonStr2);
			String relist = listArr.toString();
			
			return relist;

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
	public String qnaList(AdminCriteriaDTO cri, @RequestBody List<HashMap<String, Object>> params) throws Exception {
		List<String> listArr = new ArrayList<String>();
		AdminPageMarkerDTO pageMaker = new AdminPageMarkerDTO();
		ObjectMapper obj = new ObjectMapper();
		String jsonStr1 = "";
		String jsonStr2 = "";
		
		try {
			
			int page = (Integer) params.get(0).get("page");
			int ppp = (Integer) params.get(0).get("ppp");
			
			cri.setPage(page);
			cri.setPerPageNum(ppp);
			
			params.get(0).put("rowStart", cri.getRowStart());
			params.get(0).put("rowEnd", cri.getRowEnd());
			
			List<AdminQnaDTO> list = qnaService.qnaList(params.get(0));
			
			int countResult = qnaService.qnaTotalCount(params.get(0));
			
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(countResult);
			
			
			jsonStr1 = obj.writeValueAsString(list);
			jsonStr2 = obj.writeValueAsString(pageMaker);

			listArr.add(jsonStr1);
			listArr.add(jsonStr2);
			String relist = listArr.toString();
			
			return relist;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaAnswer.do", method = {RequestMethod.POST})
	public boolean qnaAnswer(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		try {
			
		boolean result = qnaService.qnaAnswer(params);
		
		//알람 테이블 인서트
		//Map map = params.get(2);
		for(HashMap<String, Object> oneParam : params) {
			System.out.println("oneParam찍어보기@@@"+oneParam);
			Map map = new HashMap();
			map.put("qnaNo", oneParam.get("qnaNo"));
			qnaService.alarmInsert(map);
		}
		
		System.out.println("PARAMS@@@@@@@@@"+params);
		System.out.println("CONTROLLER CHECK : " + result);
		
		
		return result;
			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return false;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/qnaAnswerUpdate.do", method = {RequestMethod.POST})
	public boolean qnaAnswerUpdate(@RequestBody List<HashMap<String, Object>> params) throws Exception {
		try{
			
			boolean result = qnaService.qnaAnswerUpdate(params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
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
