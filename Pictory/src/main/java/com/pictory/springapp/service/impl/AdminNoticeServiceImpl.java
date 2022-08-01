package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminNoticeDTO;
import com.pictory.springapp.dto.AdminNoticeService;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {

	@Autowired
	private AdminNoticeDAO noticeDAO;
	
	@Override
	public List<AdminNoticeDTO> getNoticeList(HashMap<String, Object> map) throws Exception {
		
		try {
			
			return noticeDAO.noticeList(map);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	// 공지사항 저장
	@Override
	public boolean getNoticeInsert(List<HashMap<String, Object>> map) throws Exception {
		try {
			boolean result = noticeDAO.noticeInsert(map);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	// 공지사항 업데이트
	@Override
	public boolean getNoticeUpdate(HashMap<String, Object> map) throws Exception {
		
		try {
			
			boolean result = noticeDAO.noticeUpdate(map);
			return result;
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 return false;
	}

	// 공지사항 삭제
	@Override
	public boolean getNoticeDelete(int map) throws Exception {
		
		try {
						
			boolean result = noticeDAO.noticeDelete(map);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
