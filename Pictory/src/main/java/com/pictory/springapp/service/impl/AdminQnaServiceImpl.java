package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.AdminDTO;
import com.pictory.springapp.dto.AdminQnaDTO;
import com.pictory.springapp.dto.AdminQnaService;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {

	@Autowired
	private AdminQnaDAO qnaDAO;
	
	// 총 갯수
	@Override
	public int qnaTotalCount(HashMap<String, Object> params) throws Exception {
		try {

			int result = qnaDAO.qnaTotalCount(params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}

		return 0;
	}
	
	
	// 리스트 조회
	@Override
	public List<AdminQnaDTO> qnaList(HashMap<String, Object> params) throws Exception {
		
		try {
			
			List<AdminQnaDTO> list = qnaDAO.qnaList(params);
			return list;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	@Override
	public boolean qnaAnswer(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			boolean result = qnaDAO.qnaAnswer(params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
			return false;
	}
	
	@Override
	public boolean qnaAnswerUpdate(List<HashMap<String, Object>> params) throws Exception {
		try {
			
			boolean result = qnaDAO.qnaAnswerUpdate(params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
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


	@Override
	public void alarmInsert(Map map) {
		//1) 방금 들어간 answer테이블 정보 다 뺴와서 담기(params로)
		AdminQnaDTO oneAnswer = qnaDAO.selectAnswer(map);
		
		//2) alarm 테이블 인서트
		qnaDAO.alarmInsert(oneAnswer);
		
		//PARAMS@@@@@@@@@[{answerText=asdasdasda, qnaNo=2}]
	}
}
