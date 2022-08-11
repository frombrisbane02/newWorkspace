package com.pictory.springapp.service.impl;

import java.util.ArrayList;
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
		
			List<AdminGalleryDTO> gallery = session.selectList("galleryChart", params.get(0));
			return gallery;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		//참고용! template.selectList("selectList", param);
		return null;
	}
	
	public List<AdminGalleryDTO> storyChart(List<HashMap<String, Object>> params) throws Exception {
		SqlSession session = sqlMapper.openSession();
		try {
			
			List<AdminGalleryDTO> story = session.selectList("storyChart", params.get(0));
			return story;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
			return null;
	}
	
	
	
}
