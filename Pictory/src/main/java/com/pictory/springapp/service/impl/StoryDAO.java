package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.StoryDTO;

@Repository("storyDAO")
public class StoryDAO<T> {

   @Autowired
   private SqlSessionFactory sqlMapper;
   
   @Autowired
   private SqlSessionTemplate template;
   
   
   public List<StoryDTO> virtualList() {
      
      return template.selectList("storyllist");
      
   }//virtualList

   

   public List<StoryDTO> virtualImages(int sNo) {

      System.out.println("****(dao)virtualImages까지는...왔니");
      List<StoryDTO> storyresult = template.selectList("storyimages",sNo);
      System.out.println("(dao)storyresult"+storyresult.toString());
      
      return storyresult;
      
   }//virtualImages
   
   
}////////