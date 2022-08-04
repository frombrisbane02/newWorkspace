package com.pictory.springapp.controller.feed;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.service.impl.MessageDAO;
import com.pictory.springapp.dto.MessageDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping ("/message/")
public class MessageController {
	
	@RequestMapping("Dm.do")
	public String likes() {
		System.out.println("DM 되나요?");
		
		return "feed/Dm.tiles";
	}

	@Autowired
	private MessageDAO messageDao;

	// 메세지 목록
	@RequestMapping(value = "message_list.do")
	public String message_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));
		
		String nick = (String) session.getAttribute("nick");

		MessageDTO to = new MessageDTO();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);

		return "message_list.do";
	}

	// 메세지 목록
	@RequestMapping(value="message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String nick = (String) session.getAttribute("nick");

		MessageDTO to = new MessageDTO();
		to.setNick(nick);

		// 메세지 리스트
		ArrayList<MessageDTO> list = messageDao.messageList(to);

		request.setAttribute("list", list);

		return "message_ajax_list";
	}

	@RequestMapping(value = "message_content_list.do")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		int dmRoom = Integer.parseInt(request.getParameter("dmRoom"));

		MessageDTO to = new MessageDTO();
		to.setDmRoom(dmRoom);
		to.setNick((String) session.getAttribute("nick"));

		// 메세지 내용을 가져온다.
		ArrayList<MessageDTO> clist = messageDao.roomContentList(to);

		request.setAttribute("clist", clist);

		return "message_content_list";
	}

	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "message_send_inlist.do")
	public int message_send_inlist(@RequestParam int dmRoom, @RequestParam String other_nick,
			@RequestParam String dmContent, HttpSession session) {

		MessageDTO to = new MessageDTO();
		to.setDmRoom(dmRoom);
		to.setSendNick((String) session.getAttribute("nick"));
		to.setRecvNick(other_nick);
		to.setDmContent(dmContent);

		int flag = messageDao.messageSendInlist(to);

		return flag;
	}

}