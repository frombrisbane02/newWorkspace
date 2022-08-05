package com.pictory.springapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.StoryDTO;
import com.pictory.springapp.dto.StoryService;

import lombok.AllArgsConstructor;

@SessionAttributes("userId")
@Controller
@RequestMapping("/story/")
public class StoryController {
   
   @Autowired
   private StoryService<StoryDTO> storyService;
   
   //url 저장용 상수
 	String resource = Constants.RESOURCE.toString();

   
   //종근 - 스토리 컨트롤러
   @RequestMapping("StoryIndex.do")
   public String index(Model model) {
      
      List<StoryDTO> storyList = new ArrayList<StoryDTO>();
      List<StoryDTO> returnValue = storyService.virtualList();
      
      //System.out.println("returnValue: "+returnValue.toString());
      
      for(StoryDTO storyOne : returnValue) {
//         System.out.println("storyone에 담긴 sNo: "+ storyOne.getSNo());
//         System.out.println("storyone에 담긴 title: "+ storyOne.getStoryTitle());
//         System.out.println("storyone에 담긴 desc: "+ storyOne.getStoryDescription());
//         System.out.println("storyone에 담긴 Thumb: "+ storyOne.getStoryThumbnail());
//         System.out.println("storyone에 담긴 UserId: "+ storyOne.getUserId());
//         System.out.println("storyone에 담긴 Nick: "+ storyOne.getUserNickname());
          storyOne.getSNo();
          storyOne.getStoryTitle();
          storyOne.getStoryDescription();
          storyOne.getStoryThumbnail();
          storyOne.getUserId();
          storyOne.getUserNickname();
      }
      model.addAttribute("returnValue", returnValue);
      return "story/StoryIndex.tiles";
   }
   
   
   
   @RequestMapping("virtualprocess.do")
   public String virtualprocess(@RequestParam int sNo,Model model,HttpSession req) {
      
      model.addAttribute("sNo", sNo);
      return "story/Virtual.tiles";
   }

   


   @Autowired
   private ObjectMapper mapper;
   
   
   
   @CrossOrigin
   @RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
   public @ResponseBody String virtualrest(HttpServletRequest req) throws JsonProcessingException {
      //System.out.println("스토리 가상"+ req.getParameter("sNo"));
  
      List<Map<String,String>> lists=new Vector<>();
     
      //System.out.println("이미지 for문 끝");
      List<StoryDTO> storyimages = storyService.virtualImages(Integer.parseInt(req.getParameter("sNo")));
      for(StoryDTO dto:storyimages) {
    	 Map<String,String> map = new HashMap<>();
    	 map.put("image_url", resource+dto.getPhotoUrl());
         //map.put("image_title",String.format("이미지 제목%d",dto.getPhotoName()));
    	 map.put("image_title","");
         map.put("image_id",String.format("%sID",dto.getPhotoNo()));
    	 lists.add(map);
      }
      Map resultMap = new HashMap();
      resultMap.put("data",lists);
      resultMap.put("preference", null);
     // resultMap.put("data", lists);
      
      //System.out.println(resultMap.get("preference"));
      //System.out.println("data ="+resultMap.get("data"));
      resultMap.get("preference");
      resultMap.get("data");
      
      
      return mapper.writeValueAsString(resultMap);
   }//
   
   
   /*==============썜이 주신 코드
   @CrossOrigin
   @RequestMapping(value="virtualrest.do",produces = "application/json;charset=UTF-8")
   public @ResponseBody String virtualrest() throws JsonProcessingException {
      List<Map<String,String>> lists=new Vector<>();
      for(int i=1;i <= 7 ;i++) {
         Map<String,String> map = new HashMap<>();
         map.put("image_url",String.format(" http://192.168.0.27:4040/springapp/images/%d.jpg",i));
         map.put("image_title",String.format("이미지 제목%d",i));
         map.put("image_id",String.format("%s$#@",i));
         lists.add(map);
      }
      System.out.println("이미지 for문 끝");
      Map resultMap = new HashMap();
      resultMap.put("preference", null);
      resultMap.put("data", lists);
      
      System.out.println(resultMap.get("preference"));
      System.out.println(resultMap.get("data"));
      
      return mapper.writeValueAsString(resultMap);
   }//
   */
   


   
}