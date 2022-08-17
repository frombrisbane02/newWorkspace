package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.StoryDTO;

@Repository("storyDAO")
public class StoryDAO<T> {
   
   @Autowired
   private SqlSessionTemplate template;
   
   //url 저장용 상수
 	String resource = Constants.RESOURCE.toString();
   
   
   public List<StoryDTO> virtualList() {
	   List<StoryDTO> lists = template.selectList("storyllist");
	   
	   for(StoryDTO list: lists) {
		   list.setStoryThumbnail(resource+list.getStoryThumbnail());
		   list.setUserProfile(resource+list.getUserProfile());
	   }
	   
	   
      return lists;
      
   }//virtualList

   

   public List<StoryDTO> virtualImages(int sNo) {

      List<StoryDTO> storyresult = template.selectList("storyimages",sNo);
      for(StoryDTO list: storyresult) {
		   list.setStoryThumbnail(resource+list.getStoryThumbnail());
	   }
      storyresult.toString();
      
      return storyresult;
      
   }//virtualImages
   
   
}////////