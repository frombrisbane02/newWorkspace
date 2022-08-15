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
private SqlSessionTemplate template;

	public List<AdminGalleryDTO> galleryChart(List<HashMap<String, Object>> params) throws Exception {
		
		try {
		
			List<AdminGalleryDTO> gallery = template.selectList("galleryChart", params.get(0));
			return gallery;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		
		//참고용! template.selectList("selectList", param);
		return null;
	}
	
	public List<AdminGalleryDTO> storyChart(List<HashMap<String, Object>> params) throws Exception {
		
		try {
			
			List<AdminGalleryDTO> story = template.selectList("storyChart", params.get(0));
			return story;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
			return null;
	}
	
	
	
}
