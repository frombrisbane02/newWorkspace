package com.pictory.springapp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.pictory.springapp.dto.DmDTO;
import com.pictory.springapp.service.impl.DmDAO;



@SessionAttributes({"userId"})
@Controller
@RequestMapping("/message")
public class DmController {

	@Autowired
	private DmDAO dao;

	// 메세지 목록
	@RequestMapping("DmList.do")
	public String messageList(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));
		
		String nick = (String) session.getAttribute("userId");
		if (nick == null) {
			return "auth/Login.tiles";
		} else {
		DmDTO to = new DmDTO();
		to.setUserId(nick);
		
		// 메세지 리스트
		ArrayList<DmDTO> list = dao.messageList(to);

		request.setAttribute("list", list);
		return "message/DmList";
		}
	}

	// 메세지 목록
	@RequestMapping("DmAjaxList.do")
	public String messageAjaxList(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nick = (String) session.getAttribute("userId");
		
		DmDTO dto = new DmDTO();
		dto.setUserId(nick);
		
		
		// 메세지 리스트
		List<DmDTO> list = dao.messageList(dto);

		request.setAttribute("list", list);
		
		return "message/DmAjaxList";
		
	}

	@RequestMapping(value = "/DmContentList.do")
	public String DmContentList(HttpServletRequest request, HttpSession session) {

		int dmRoom = Integer.parseInt(request.getParameter("dmRoom"));
		
		DmDTO to = new DmDTO();
		to.setDmRoom(dmRoom);
		to.setReadNick("KIM");
		to.setUserId((String) session.getAttribute("userId"));
	
		
		// 메세지 내용을 가져온다.
		ArrayList<DmDTO> clist = dao.roomContentList(to);
		
		request.setAttribute("clist", clist);

		return "message/DmContentList";
	}

	// 메세지 리스트에서 메세지 보내기
	
	@ResponseBody
	@RequestMapping(value = "/DmSendList.do")
	public int DmSendList(@RequestParam int dmRoom, @RequestParam String otherNick,
			@RequestParam String dmContent, HttpSession session) {

		DmDTO to = new DmDTO();
		to.setDmRoom(dmRoom);
		to.setSendNick((String) session.getAttribute("userId"));
		to.setReadNick(otherNick);
		to.setDmContent(dmContent);

		int flag = dao.dmSendList(to);

		return flag;
	}

}


