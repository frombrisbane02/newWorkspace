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
   
 	String resource = Constants.RESOURCE.toString();

   @RequestMapping("StoryIndex.do")
   public String index(Model model) {
      
      List<StoryDTO> storyList = new ArrayList<StoryDTO>();
      List<StoryDTO> returnValue = storyService.virtualList();
      
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
  
      List<Map<String,String>> lists=new Vector<>();

      List<StoryDTO> storyimages = storyService.virtualImages(Integer.parseInt(req.getParameter("sNo")));
      for(StoryDTO dto:storyimages) {
    	 Map<String,String> map = new HashMap<>();
    	 map.put("image_url", resource+dto.getPhotoUrl());
    	 map.put("image_title","");
         map.put("image_id",String.format("%sID",dto.getPhotoNo()));
    	 lists.add(map);
      }
      Map resultMap = new HashMap();
      resultMap.put("data",lists);
      resultMap.put("preference", null);

      resultMap.get("preference");
      resultMap.get("data");
      
      return mapper.writeValueAsString(resultMap);
   }//
   
  
   
}