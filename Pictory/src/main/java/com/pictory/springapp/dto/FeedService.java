package com.pictory.springapp.dto;

import java.util.List;

public interface FeedService<T> {
	
	//Gallery List 뿌려주는 서비스
	List<GalleryDTO> galleryList();
	
	List<GalleryDTO> galleryPhoto(int postNo);

	//클릭한 postNo로 가져오기
	List<GalleryDTO> galleryView(int postNo);
	
	List<T> virtualList();
	
	
	List<T> virtualImages(int sNo);

	
}
