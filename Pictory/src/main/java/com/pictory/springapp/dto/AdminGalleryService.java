package com.pictory.springapp.dto;

import java.util.List;

public interface AdminGalleryService {
	List<AdminGalleryDTO> galleryList(AdminGalleryDTO param) throws Exception;
}

