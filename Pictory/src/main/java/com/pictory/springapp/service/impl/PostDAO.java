package com.pictory.springapp.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.pictory.springapp.dto.PostDTO;

@Repository("postDAO")
public class PostDAO {

	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	

	public int postInsert(Map map) {
		
		int postNo = template.insert("postUpload", map);
		System.out.println("dao에서 호출해 가져온 현재 postNo:"+postNo);
		return postNo;
	}
	
	public int photoInsert(Map<String, Object> fileInfo) {
		System.out.println("FILEINFO"+fileInfo);
		
		return  template.insert("photoUpload", fileInfo);
	}
	
	
	public int getPostNo() {
		//postUpload 이후 가져온 postNo
		return template.selectOne("getPostNo");
	}


	public int postDelete(Map map) {
		return 0;
	}

	public int postUpdate(Map map) {
		return 0;
	}
	
	public String uploadingFile(Map map,List<MultipartFile> uploadImage) {
		
			//1) map 안에 있는 userID 갖고 와서 그걸로 mkdir 생성하기
			//이거 path 바꾸기 (전에 한 springproj 참고)
			String path = "C:\\Users\\solhe\\Desktop\\uploadImage\\"+map.get("userId");
			File Folder = new File(path);
		try{
			if (!Folder.exists()) {
				    Folder.mkdir();
				    System.out.println("폴더 생성!");
			} 
			else {System.out.println("이미 폴더 있음;;");}
			
			
			//2) 파일 해당 경로에 업로드하기
			for(int i=0; i < uploadImage.size(); i++) {
				File dest = new File(path+File.separator+uploadImage.get(i).getOriginalFilename());
				
				System.out.println((int)Math.ceil(uploadImage.get(i).getSize()/1024.0)+"KB");
				System.out.println("파일명"+uploadImage.get(i).getOriginalFilename());
				
				uploadImage.get(i).transferTo(dest);
				
			}//for

		}//try
		catch(Exception e) {e.getStackTrace();}
		
		return path;
	}

	public String uploadStoryThumbnail(Map map, MultipartFile storyThumbnail) {
		String path = "C:\\Users\\solhe\\Desktop\\uploadImage\\"+map.get("userId");
		File dest = new File(path+File.separator+storyThumbnail.getOriginalFilename());
		try {storyThumbnail.transferTo(dest);}
		catch (Exception e) {e.printStackTrace();}
		
		return path+storyThumbnail.getOriginalFilename();
	}

	public int storyInsert(Map map) {
		//story Insert에 필요한것: SEQ_STORY, storyThumnail, storyTitle, storyDescription
		
		return template.insert("storyInsert",map);
	}

	public int getSNo(Map map) {
		//sNo 있으면 셀렉해오는것임
		return template.selectOne("getSNo", map);
				
	}




	
}
