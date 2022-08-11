package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminGalleryService {
//	List<AdminGalleryDTO> galleryList(AdminGalleryDTO param) throws Exception;
	public List<AdminGalleryDTO> gelleryChart(List<HashMap<String, Object>> param) throws Exception;
	public List<AdminGalleryDTO> storyChart(List<HashMap<String, Object>> param) throws Exception;
}
