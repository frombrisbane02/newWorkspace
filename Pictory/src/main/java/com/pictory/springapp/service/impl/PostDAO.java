package com.pictory.springapp.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.converters.StringArrayConverter;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.PostDTO;

@Repository("postDAO")
public class PostDAO {
	
	@Autowired
	private SqlSessionTemplate template;

	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	

	public int postInsert(Map map) {
		
		int success = template.insert("postUpload", map);
		return success;
	}
	
	public int photoInsert(Map<String, Object> fileInfo) {
		
		return  template.insert("photoUpload", fileInfo);
	}
	
	//ADD START DONGMI SHIN
	public int insertPhoto(Map<String,Object> map) {
		template.insert("photoUpload",map);
		return Integer.parseInt(String.valueOf(map.get("photoNo")));
	}
	//ADD END DONGMI SHIN
	
	
	public int getPostNo() {
		//postUpload 이후 가져온 postNo
		return template.selectOne("getPostNo");
	}
	
	public int getPhotoNo(Map map) {
		//방금 포토 업로드했는데 그 방금 업로드한 한장짜리 photo의 고유 no 갖고오기
		return template.selectOne("getPhotoNo", map);
		//map에 넘겨줘야지 개쓰레기색갸ㅠㅠ
		
	}


	public int postDelete(Map map) {
		return 0;
	}

	public int postUpdate(Map map) {
		return 0;
	}
	
	public String uploadingFile(Map map,List<MultipartFile> uploadImage) {
		
			//1) map 안에 있는 userID 갖고 와서 그걸로 mkdir 생성하기
		
		
			String path = String.valueOf(map.get("path"))+"\\img\\"+String.valueOf(map.get("userId"));
			
			File Folder = new File(path);
		try{
			if (!Folder.exists()) {
				    Folder.mkdir();
			} 
			else {System.out.println("이미 폴더 있음;;");}
			
			
			//2) 파일 해당 경로에 업로드하기
			for(int i=0; i < uploadImage.size(); i++) {
				File dest = new File(path+File.separator+uploadImage.get(i).getOriginalFilename());
				
				//System.out.println((int)Math.ceil(uploadImage.get(i).getSize()/1024.0)+"KB");
				//System.out.println("파일명"+uploadImage.get(i).getOriginalFilename());
				
				uploadImage.get(i).transferTo(dest);
				
			}//for

		}//try
		catch(Exception e) {e.getStackTrace();}
		
		
		return String.valueOf(map.get("userId"));
	}
	
	
	public String uploadingOneFile(Map map, MultipartFile uploadImage) {
		// 파일 한장짜리 업로드!!
		//1) map 안에 있는 userID 갖고 와서 그걸로 mkdir 생성하기
		
		//1.1) path 똑바로 설정갈겨야댐 ㅠㅠ 
		String path = String.valueOf(map.get("path"))+"\\img\\"+String.valueOf(map.get("userId"));
		File Folder = new File(path);
		
		try{
			if (!Folder.exists()) {
				    Folder.mkdir();
			} 
			else {System.out.println("이미 폴더 있음;;");}
		
		
		//2) 파일 해당 경로에 업로드하기(한장)
		File dest = new File(path+File.separator+uploadImage.getOriginalFilename());
		
		//System.out.println((int)Math.ceil(uploadImage.getSize()/1024.0)+"KB");
		//System.out.println("파일명"+uploadImage.getOriginalFilename());
		
		uploadImage.transferTo(dest);

		}//try
		catch(Exception e) {e.getStackTrace();}
		
		return String.valueOf(map.get("userId"))+"/"+uploadImage.getOriginalFilename();
	}

	public String uploadStoryThumbnail(Map map, MultipartFile storyThumbnail) {
		
		String path = String.valueOf(map.get("path"))+"\\img\\"+String.valueOf(map.get("userId"));
		File dest = new File(path+File.separator+storyThumbnail.getOriginalFilename());
		try {storyThumbnail.transferTo(dest);}
		catch (Exception e) {e.printStackTrace();}
		
		
		return String.valueOf(map.get("userId"))+"/"+storyThumbnail.getOriginalFilename();
	}

	public int storyInsert(Map map) {
		//story Insert에 필요한것: SEQ_STORY, storyThumnail, storyTitle, storyDescription
		
		return template.insert("storyInsert",map);
	}

	public int getSNo(Map map) {
		//sNo 있으면 셀렉해오는것임
		return template.selectOne("getSNo", map);
	}

	public int hashtagInsert(Map map) {
		
		//null 체크 먼저 !!!
		//map 안에서 해시태그랑 postNo 꺼내오고, 새로운 map에 postNo 미리 넣어두기
		//map안에서 꺼낸 해시태그 스트링에 저장하고 split해서 map에 계속 담기
		if(map.get("hashtags")!=null && !map.get("hashtags").equals("")) {
			
		//시간나면 trim도 다 해서 담아주기
			String strhashtags = String.valueOf(map.get("hashtags"));
			String[] strarrhashtag = strhashtags.split(",");
			Map<String,Object> hashtags = new HashMap<String, Object>();
			for(int i=0; i< strarrhashtag.length; i++) {
				hashtags.put("postNo", map.get("postNo"));
				hashtags.put("hashtag", strarrhashtag[i].trim());
				//해시태그 돌면서 배열에서 꺼내서 다 넣으셈ㅠ
				template.insert("hashtagInsert",hashtags);
			}
		}
		return 1;
	}

	public int productInsert(Map map) {
		//PRODUCT TABLE - map에 가격 담겨있음
		//pdNo ㄱㅊ photoNo 뽑아와야함
		int photoNo = getPhotoNo(map);
		
		map.put("photoNo", photoNo);
		
		template.insert("productInsert",map);
		
		return 1;
	}

	public List<PostDTO> getStoryList(String userId) {
		List<PostDTO> lists = template.selectList("getStoryList",userId);
		for(PostDTO list : lists) {
			list.setStoryThumbnail(resource+list.getStoryThumbnail());
		}
		return lists;
	}

	public void insertMarker(Map map) {
		template.insert("insertMarker",map);
	}



	
}
