package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.ListPagingData;
import com.pictory.springapp.dto.NoticeDTO;
import com.pictory.springapp.dto.NoticeService;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService<NoticeDTO>{
	//OneMemoDAO주입]	
		@Autowired
		private NoticeDAO dao;	
		
		
		//리소스파일(paging.properties)에서 읽어오기
	
		@Override
		public List<NoticeDTO> noticeSelectList(Map map) {
			// TODO Auto-generated method stub
			return dao.noticeSelectList(map);
		}


		public NoticeDTO selectOne(Map map) {
			NoticeDTO record=dao.selectOne(map);
			//줄바꿈 처리
			
			return record;
			
		}
		
		
	
	
}