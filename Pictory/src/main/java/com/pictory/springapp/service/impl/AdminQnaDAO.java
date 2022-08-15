package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdminQnaDTO;

@Repository("adminqnaDAO")
public class AdminQnaDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	// 총 갯수
	public int qnaTotalCount(HashMap<String, Object> params) throws Exception{
		
		try {
			
			if("ANSWER".equals(params.get("answerChk"))) {		
				
				params.put("column", "AND NOT a.ANSWERTEXT IS NULL");
				
			}else if("NOTANSWER".equals(params.get("answerChk"))) {
				
				params.put("column", "AND a.ANSWERTEXT IS NULL");
				
			}else {
				
				params.put("column", "");
			}
			
			int result = template.selectOne("qnaTotalCount", params);
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return 0;
	}
	
	
	// 리스트 조회
	public List<AdminQnaDTO> qnaList(HashMap<String, Object> params) throws Exception {
		
		
		try {
			
			if("ANSWER".equals(params.get("answerChk"))) {
				
				params.put("column", "AND NOT a.ANSWERTEXT IS NULL");
				
			} else if("NOTANSWER".equals(params.get("answerChk"))) {
				
				params.put("column", "AND a.ANSWERTEXT IS NULL");
				
			} else {
				
				params.put("column", "");
			}
			
			List<AdminQnaDTO> list = template.selectList("qnaList", params);

			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return null;
	}
	
	
	@Transactional
	public boolean qnaAnswer(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			boolean result = false;
			int check = 0;
			
			check = template.insert("adminQnaAnswer", params.get(0));
			
			if(check > 0) {
				result = true;
			}
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		
			return false;
	}
	
	
	@Transactional
	public boolean qnaAnswerUpdate(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			boolean result = false;
		
			int check = template.update("adminQnaAnswerUpdate", params.get(0));
			
			if(check > 0) {
				result = true;
			}

			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		
			return false;
	}
	
	@Transactional
	public boolean qnaDelete(int qnaNo) throws Exception {
		
		boolean result = false;
		
		try{
			
			int check1 = template.delete("qnaDelete", qnaNo);
			int check2 = template.delete("answerDelete", qnaNo);
			
			if(check1 == 1 && check2 == 1) {
				result = true;
			}
			
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return false;
	}

	public AdminQnaDTO selectAnswer(Map map) {
		
		return template.selectOne("selectAnswer", map);
		
		
	}

	public void alarmInsert(AdminQnaDTO oneAnswer) {
		template.insert("alarmInsert", oneAnswer);
	}


	
	
}
