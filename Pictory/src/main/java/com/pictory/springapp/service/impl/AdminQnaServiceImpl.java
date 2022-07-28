package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminDTO;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminQnaService;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private AdminQnaDAO qnaDAO;
	
	@Override
	public List<AdminQnaDTO> qnaList(HashMap<String, Object> map) throws Exception {
		
		try {
			
			List<AdminQnaDTO> list = qnaDAO.qnaList(map);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean qnaDelete(int qnaNo) throws Exception {
		try {
			
			return qnaDAO.qnaDelete(qnaNo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
