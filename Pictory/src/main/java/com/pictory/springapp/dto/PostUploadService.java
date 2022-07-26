package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface PostUploadService<T> {
	
	//입력/수정/삭제
	//int postInsert(Map map);
	int postDelete(Map map);
	int postUpdate(Map map);
	String uploadingFile(Map map, List<MultipartFile> uploadImage);
	int photoInsert(Map fileList);
	
	//post 넣는 곳에 photo 업로드용 리스트 같이 넘기기
	int postInsert(Map map, List<Map<String, Object>> fileInfo);
	
	//Story 생성하는 경우 썸네일 업로드용!
	String uploadStoryThumbnail(Map map, MultipartFile storyThumbnail);
	int storyInsert(Map map);
	
}