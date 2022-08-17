package com.pictory.springapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.drew.imaging.ImageMetadataReader;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.GpsDirectory;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@Controller
public class RestController {
	
	@Autowired
	private PostUploadService<PostDTO> postUploadService;
	
	@CrossOrigin
	@RequestMapping(value="/gallery/uploadFile.do",method = RequestMethod.POST)
	public @ResponseBody Map<String,Object> uploadFile(MultipartHttpServletRequest req) throws IllegalStateException, IOException {
		Map<String,Object> map = new HashMap<>();
		try {
			
			String userId = req.getParameter("userId");	
			//System.out.println("userId:"+userId);	
			String postNo = req.getParameter("postNo");		
			//System.out.println("postNo:"+postNo);	
		
			String productPrice = req.getParameter("productPrice");		
			//System.out.println("productPrice:"+productPrice);	
			List<MultipartFile> files=req.getFiles("uploadFile");
			//System.out.println("다중파일 업로드 갯수:"+files.size());
			
			
			//서버의 물리적 경로 얻기
			String path = req.getSession().getServletContext().getRealPath("/upload/img/")+req.getParameter("userId");
			//다중 파일 업로드 부분
			for(MultipartFile upload:files) {
				
				File file = new File(path);
				if(!file.exists()) {
					file.mkdir();
				}
				//File객체 생성			
				File f = new File(file.getAbsolutePath()+File.separator+upload.getOriginalFilename());
				//System.out.println("f.getName()(파일명):"+f.getName());
				//업로드
				upload.transferTo(f);
				
				//DB입력				
				map.put("postNo",req.getParameter("postNo"));
				map.put("photoSize","0");
				map.put("photoName",f.getName());
				map.put("photoUrl",req.getParameter("userId")+"/"+f.getName());
				map.put("productPrice",req.getParameter("productPrice"));
				String photoNo =String.valueOf(postUploadService.photoInsert(map));
				//System.out.println("photoNo:"+photoNo);
			}			
			map.put("isSucess","Sucess");
			
						
		}
		catch(Exception e) {
			e.printStackTrace();
			map.put("isSucess","FAIL");
		}
			
		return map;
	}/////////////////
	
	
	
	@CrossOrigin
	@RequestMapping(value="/gps.do")
	public @ResponseBody Map<String,String> gps(@RequestParam String filename,HttpServletRequest req) {

		Map<String,String> map = new HashMap<>();
		//서버의 물리적 경로 얻기
		String path = req.getSession().getServletContext().getRealPath("/upload/img/");
		//File객체 생성
		File file = new File(path+filename);
		try {
			Metadata metadata = ImageMetadataReader.readMetadata(file);
			GpsDirectory gpsDirectory = metadata.getFirstDirectoryOfType(GpsDirectory.class);
			System.out.println("gpsDirectory:"+gpsDirectory);
			//위도,경도 호출
			if(gpsDirectory !=null && gpsDirectory.containsTag(GpsDirectory.TAG_LATITUDE) && gpsDirectory.containsTag(GpsDirectory.TAG_LONGITUDE)) {

				String sLat = String.valueOf(gpsDirectory.getGeoLocation().getLatitude());
				String sLng = String.valueOf(gpsDirectory.getGeoLocation().getLongitude());
				System.out.println("위도:"+sLat+"경도:"+sLng);
				map.put("lat", sLat);
				map.put("lng", sLng);
			}
		}
		catch(Exception e) {e.printStackTrace();}
		return map;
	}

}
