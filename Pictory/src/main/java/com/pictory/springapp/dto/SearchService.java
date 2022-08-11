package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface SearchService<T> {
	//조회(검색)
	List<SearchDTO> searchSelect(Map map);
	//해시태그
//	List<SearchDTO> hashList();
//	//카테고리별 조회
////	List<SearchDTO> categorySelect(String postCategory);
//

	

	int findCartinList(Map map);

	int findPdNo(Map map);

	void deleteCart(Map map);

	void insertCart(Map map);

	Integer searchLike(int postNo, String userId);



	void searchlikeUp(int postNo, String userId);



	void searchlikeDown(int postNo, String userId);



	Integer getsearchlikes(int postNo);

	

	

	

}
