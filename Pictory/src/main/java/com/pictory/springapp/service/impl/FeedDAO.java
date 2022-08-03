package com.pictory.springapp.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.StoryDTO;

@Repository("feedDAO")
public class FeedDAO {

	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<FeedDTO> feedList() {
		
	
		return null;
	}
	
	
	   public List<StoryDTO> virtualList() {
		      
		      return template.selectList("feedstorylist");
		      
		   }//virtualList

		   

		   public List<StoryDTO> virtualImages(int sNo) {

		      System.out.println("****(dao)virtualImages까지는...왔니");
		      List<StoryDTO> storyresult = template.selectList("feedstoryimages",sNo);
		      System.out.println("(dao)storyresult"+storyresult.toString());
		      
		      return storyresult;
		      
		   }//virtualImages
}

