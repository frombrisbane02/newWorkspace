package com.pictory.springapp.dto;

import java.util.List;

public interface GalleryService<T> {
	
	//Gallery List 뿌려주는 서비스
	List<GalleryDTO> galleryList();
	
}
