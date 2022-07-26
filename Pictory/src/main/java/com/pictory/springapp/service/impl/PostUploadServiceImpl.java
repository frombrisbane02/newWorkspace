package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.PostUploadService;

@Service("postUploadService")
public class PostUploadServiceImpl implements PostUploadService<PostDTO> {
	
	//PostDAO주입)
	@Autowired
	private PostDAO dao;
	
	
	// 파일 디렉토리 만들기, 파일 업로드하기
	@Override
	public String uploadingFile(Map map,List<MultipartFile> uploadImage) {
		return dao.uploadingFile(map,uploadImage);
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
		System.out.println("ServiceImpl 내의 postNo:"+postNo);
		
		for(Map<String,Object> oneFile : fileInfo) {
			//하나하나 빼온 맵에 postNo 다 넣어주고
			oneFile.put("postNo", postNo);
			
			//3) photoInsert하기
			dao.photoInsert(oneFile);	
		}
		
		//이건 걍 보내... ㅎ;
		return 1;
	};
	
	@Override
	public int storyInsert(Map map) {
		//story Insert에 필요한것: SEQ_STORY, storyThumnail, storyTitle, storyDescription
		return dao.storyInsert(map);
	}
	

	//파일 DB에 넣기
	@Override
	public int photoInsert(Map fileList) {
		// TODO Auto-generated method stub
		return 0;
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
