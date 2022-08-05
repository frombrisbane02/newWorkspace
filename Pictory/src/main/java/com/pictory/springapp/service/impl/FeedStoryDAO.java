package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.FeedDTO;
import com.pictory.springapp.dto.StoryDTO;

@Repository("feedStoryDAO")
public class FeedStoryDAO<T> {

   @Autowired
   private SqlSessionFactory sqlMapper;
   
   @Autowired
   private SqlSessionTemplate template;
   
   
   public List<FeedDTO> virtualList() {
      
      return template.selectList("storyllist");
      
   }//virtualList

   

   public List<FeedDTO> virtualImages(int sNo) {

      //System.out.println("****(dao)virtualImages까지는...왔니");
      List<FeedDTO> storyresult = template.selectList("storyimages",sNo);
      //System.out.println("(dao)storyresult"+storyresult.toString());
      storyresult.toString();
      
      return storyresult;
      
   }//virtualImages
   
   
}////////