package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository("faqDAO")
public class FaqDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	
	@Transactional
	public boolean faqSave(List<HashMap<String, Object>> params) throws Exception {
		
		SqlSession session = sqlMapper.openSession();
		
		try {
			
			boolean result = false;
			int check = 0;
			
			for(int i = 0; i < params.size(); i++) {
				
				check = session.insert("faqSave", params.get(i));
				
				if(check == 1) {
					result = true;
				}else {
					result = false;
				}
			}
						
			return result;
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return false;
		
	}
	
	
	
}
