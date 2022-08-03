package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface GalleryService<T> {
	
	//Gallery List 뿌려주는 서비스
	List<GalleryDTO> galleryList();
	
	//클릭한 뷰의 사진 url 뽑아오기
	//List<Map<String, Object>> galleryPhoto(Map postMap);
	
	List<GalleryDTO> galleryPhoto(int postNo);

	//클릭한 postNo로 가져오기
	List<GalleryDTO> galleryView(int postNo);

	List<GalleryDTO> galleryInfo(int postNo);

	
	
}
