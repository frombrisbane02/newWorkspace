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

import com.pictory.springapp.dto.AdminUsersDTO;


@Repository("faqDAO")
public class FaqDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	@Transactional
	public boolean faqSave(List<HashMap<String, Object>> params) throws Exception {
		
		
		
			boolean result = false;
			int check = 0;
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("userId", (String) params.get(i).get("userId"));
			}
	
			List<AdminUsersDTO> list = template.selectList("faquserInfo", map);
			
			for(AdminUsersDTO list2 : list) {
				params.get(0).remove("userId");
				params.get(0).put("userNo", list2.getUserNo());
			}
		
			check = template.insert("faqSave", params);
			
			if(check == 1) {
				result = true;
			}else {
				result = false;
			}
		
			return result;
		
		
		
	}


	
	
}

