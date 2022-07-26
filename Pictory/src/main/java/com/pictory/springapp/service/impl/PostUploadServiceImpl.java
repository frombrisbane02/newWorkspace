package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@Service("postUploadService")
public class PostUploadServiceImpl implements PostUploadService<PostDTO> {
	
	//PostDAO주입)
	@Autowired
	private PostDAO dao;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();
	
	
	// 파일 디렉토리 만들기, 파일 업로드하기
	@Override
	public String uploadingFile(Map map,List<MultipartFile> uploadImage) {
		// 파일 여러장짜리 업로드용!!
		return dao.uploadingFile(map,uploadImage);
	}
	
	@Override
	public String uploadoneFile(Map map, MultipartFile uploadImage) {
		// 파일 한장짜리 업로드용!!
		return dao.uploadingOneFile(map,uploadImage);
	}

	
	
	//스토리 이미지 썸네일 업로드하기
	@Override
	public String uploadStoryThumbnail(Map map, MultipartFile storyThumbnail) {
		return dao.uploadStoryThumbnail(map, storyThumbnail);
	}
	
	
	//부모에 insert 먼저하고, 그 뒤에 photoInsert하기
	@Override
	public int postInsert(Map map, List<Map<String, Object>> fileInfo) {
		
		if(map.get("storyThumbnail")!=null) {
		//0) 스토리 생성한 경우에는 sNo 갖고와야함
		int sNo = dao.getSNo(map);
		map.put("sNo", sNo);
		
		}
		
		
		//1) 부모인 postInsert부터 호출
		dao.postInsert(map);
		
		
		//2) SEQ_POST.CURRVAL 갖고와서 int에 postNo로 넣고, 리스트에 추가해서 전달하기
		int postNo = dao.getPostNo();
		map.put("postNo", postNo);
		System.out.println("ServiceImpl 내의 postNo:"+postNo);
		
		for(Map<String,Object> oneFile : fileInfo) {
			//하나하나 빼온 맵에 postNo 다 넣어주고
			oneFile.put("postNo", postNo);
			
			//3) photoInsert하기
			dao.photoInsert(oneFile);
		}
		
		//4) photoInsert 후에 hashtag insert
		if(map.get("hashtags")!=null && !map.get("hashtags").equals("")) {
			dao.hashtagInsert(map);
		}
		else {System.out.println("해시태그 null임;;;;");}
		
		
		//5) 지도 있는 경우 지도 insert해야함
		if(map.get("markerLocation")!=null && !map.get("markerLocation").equals("")) {
			map.put("postNo", postNo);
			map.put("markerName", "출사정보");
			dao.insertMarker(map);
		}
		
		
		//이건 걍 보내... ㅎ;
		return 1;
	};	
	
	
	@Override
	public int storyInsert(Map map) {
		//story Insert에 필요한것: SEQ_STORY, storyThumnail, storyTitle, storyDescription
		return dao.storyInsert(map);
	}
	
	@Override
	public int sellPostInsert(Map map) {
		//insert 순서: post - photo - product
		
		//1) 부모인 postInsert부터 호출
		dao.postInsert(map);
		
		//2) photo 넣어야함 SEQ_POST.CURRVAL 갖고와서 int에 postNo로 넣고 전달하기
		int postNo = dao.getPostNo();
		map.put("postNo", postNo);
		
		//photoInsert 호출
		dao.photoInsert(map);
		
		//3) photo 넣었으면 product 넣어야함
		dao.productInsert(map);
		
		//4) 다 했으면 hashtag 넣기
		if(map.get("hashtags")!=null && !map.get("hashtags").equals("")) {
			dao.hashtagInsert(map);
		}
		else {System.out.println("해시태그 null임;;;;");}
		
		return 1;
	}
	
	
	@Override
	public List<PostDTO> selectStoryList(String userId) {
		// 스토리 리스트 뿌려주기
		return dao.getStoryList(userId);
	}




	
	

	@Override
	public String editedImageInfo(Map<String, Object> fileInfo) {
		
		
		return null;
	}



	//파일 DB에 넣기
	@Override
	public int photoInsert(Map map) {
		
		int photoNo = dao.insertPhoto(map);
		
		if(map.get("productPrice") !=null && !String.valueOf(map.get("productPrice")).equals("")) {
			map.put("photoNo", String.valueOf(photoNo));
			map.put("price", map.get("productPrice"));
			
			
			int sucess = dao.productInsert(map);
		}
		return photoNo;
		//ADD END DONGMI SHIN
	}
	

	@Override
	public int postDelete(Map map) {
		return dao.postDelete(map);
	}

	@Override
	public int postUpdate(Map map) {
		return dao.postUpdate(map);
	}

	


}
