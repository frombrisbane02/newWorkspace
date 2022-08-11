package com.pictory.springapp.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pictory.springapp.dto.ListPagingData;
import com.pictory.springapp.dto.NoticeDTO;
import com.pictory.springapp.dto.NoticeService;
import com.pictory.springapp.service.impl.NoticeServiceImpl;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	//서비스 주입]
		@Autowired
		private NoticeServiceImpl noticeService;
		
		
		/*로그인 하지 않고 각 컨트롤러 메소드 실행시 오류:인자로 @ModelAttribute("id") String id추가시 */
		//씨큐리티 사용시에는 아래 예외처리 불필요
		/*
		@ExceptionHandler({Exception.class})
		public String error(Model model) {
			model.addAttribute("NotMember","로그인후 이용바람...");
			//뷰정보 반환]-로그인이 안된 경우 로그인 페이지로
			return "onememo10/member/Login";
		}//////////////////	*/
		
		//목록 처리]
		@RequestMapping("Index.do")
		public String noticeIndex(
				//@ModelAttribute("id") String id, //스프링씨큐리티 사용시 불필요
				@RequestParam Map map,
				HttpServletRequest req,
				Model model) {		
			
			//서비스 호출]
			//현재 페이지를 맵에 저장
			//map.put(PagingUtil.NOW_PAGE, nowPage);
			List<NoticeDTO> list=noticeService.noticeSelectList(map);	
			
			for(NoticeDTO dto : list) {
			//	System.out.println(dto.getNoticeCategory());
				System.out.println(dto.getNoticeCode());
				System.out.println(dto.getNoticeContent());
				System.out.println(dto.getNoticeNo());
				System.out.println(dto.getNoticeTitle());
				System.out.println(dto.getUserNo());
				System.out.println(dto.getNoticeDate());
			}
			
			//데이타 저장]		
			model.addAttribute("list",list);
			
			//뷰정보 반환]
			return "notice/Index.tiles";
		}/////////////list
		
	
	//내용 뿌리기
		@RequestMapping("NoticeView.do")
		public String noticeView(
				@RequestParam Map map,Model model){
			//서비스 호출]
			System.out.println("넝어논아:"+map.get("noticeNo"));
			NoticeDTO record= noticeService.selectOne(map);
			
			//데이타 저장]		
			model.addAttribute("record", record);
			System.out.println("공지사항 상세내용 안들어올래?");
			return "notice/NoticeView.tiles";
		}

}
