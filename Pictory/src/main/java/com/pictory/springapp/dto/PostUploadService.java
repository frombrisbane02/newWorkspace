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
	
	//post 넣는 곳에 photo 업로드용 리스트 같이 넘기기(map에 해시태그도 있어요..)
	int postInsert(Map map, List<Map<String, Object>> fileInfo);
	
	//Story 생성하는 경우 썸네일 업로드용!
	String uploadStoryThumbnail(Map map, MultipartFile storyThumbnail);
	int storyInsert(Map map);
	
	//이거는 파일 업로드용인데 한장짜리 업로드용!
	String uploadoneFile(Map map, MultipartFile uploadImage);
	int sellPostInsert(Map map);
	
	//편집된 이미지 저장될때마다 서비스 호출
	String editedImageInfo(Map<String, Object> fileInfo);
	
	//업로드2로 넘어갈때 스토리 있으면 뿌려주기 위한 서비스
	List<PostDTO> selectStoryList(Map userId);
	
}