package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface GalleryService<T> {
	
	//Gallery List 뿌려주는 서비스
	List<GalleryDTO> galleryList(String userId);
	
	//클릭한 뷰의 사진 url 뽑아오기
	//List<Map<String, Object>> galleryPhoto(Map postMap);
	
	List<GalleryDTO> galleryPhoto(int postNo);

	//클릭한 postNo로 가져오기
	List<GalleryDTO> galleryView(int postNo);

	//작가 정보 가져오기
	List<GalleryDTO> galleryInfo(int postNo);
	
	//List<GalleryDTO> galleryFilter(String postCategory);
	List<GalleryDTO> galleryFilter(String[] postCategory);
	


	//Comment 가져오기
	List<GalleryDTO> getComments(int postNo);

	//갤러리 리스트 해시태그 가져오기
	List<GalleryDTO> hashList();

	//갤러리 뷰 상품 정보 가져오기
	GalleryDTO getProductInfo(int postNo);
	
	//상품 판매 여부 반환하기
	int isSellorNot(int postNo);

	//로그인한 사람 정보 다 갖고오기
	GalleryDTO getLoginInfo(String userId);

	void likeUp(int postNo, String userId);

	void likeDown(int postNo, String userId);

	Integer findLike(int postNo, String userId);

	Integer userNum(Map map);


	List findUserPostno(String userId);

	void galleryComment(Map map);

	int findCart(Map map);

	void deleteCart(Map map);

	Integer getpostlikes(int postNo);
	
	void insertCart(Map map);

	int isMapAttached(int postNo);

	GalleryDTO getMapInfo(int postNo);

	int findCartinList(Map map);

	int findPdNo(Map map);
	
	
	
}
