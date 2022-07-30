package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminGalleryDTO;

@Repository("admingalleryDAO")
public class AdminGalleryDAO {
	//List<AdminGalleryDTO> selectList(AdminGalleryDTO param);
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	//- SqlSessionTemplate사용: 위 프로그래밍 순서 가, 나에서는 commit(), 다의 close()호출 불필요
	
//	@Autowired
//	private SqlSessionTemplate template;

	public List<AdminGalleryDTO> galleryChart(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminGalleryDTO> list =  session.selectList("galleryChart", map);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		//참고용! template.selectList("selectList", param);
		return null;
	}
	
	
	
}
	
