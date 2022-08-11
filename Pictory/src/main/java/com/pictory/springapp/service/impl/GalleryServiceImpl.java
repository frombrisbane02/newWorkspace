package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;
import com.pictory.springapp.dto.LikeDTO;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService<GalleryDTO> {
	
	@Autowired
	private GalleryDAO dao;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();

	@Override
	public List<GalleryDTO> galleryList(String userID) {
		//필요 인자: 카테고리, 해시태그, 첫번째 이미지 url(썸네일용), 좋아요수, 댓글 수, 유저프사, 유저닉네임
		//postNo 받아올때마다 for문 돌면서 해당 postNo에 대한 cart 여부 받아오기
		/*
		List<GalleryDTO> Lists = dao.selectGalleryList(userID);
		Map map = new HashMap();
		map.put("userId", userID);
		
		for(GalleryDTO oneList : Lists) {
			map.put("postNo", oneList.getPostNo());
			int cartornot = dao.findCartinList(map);
			oneList.setCartornot(cartornot);
		}
		*/
		return dao.selectGalleryList(userID);
	}
	
	@Override
	public List<GalleryDTO> galleryPhoto(int postNo) {
		
		return dao.selectPhotoList(postNo);
	}

	@Override
	public List<GalleryDTO> galleryView(int postNo) {
		
		return dao.selectGalleryView(postNo);
	}

	@Override
	public List<GalleryDTO> galleryInfo(int postNo) {
		//작가 정보 뿌려주기위한 글
		return dao.selectUserInfo(postNo);
	}
	

	@Override
	public List<GalleryDTO> galleryFilter(String[] postCategory) {
		return dao.selectFilter(postCategory);
	}


	@Override
	public List<GalleryDTO> getComments(int postNo) {
		// 코멘트 가져오기
		return dao.selectCommentList(postNo);
	}

	@Override
	public List<GalleryDTO> hashList() {
		// 해시태그 가져오기
		return dao.getHashList();
	}

	@Override
	public GalleryDTO getProductInfo(int postNo) {
		// 갤러리뷰 상품정보(있는 경우) 가져오기
		return dao.getProductInfo(postNo);
	}
	
	@Override
	public int isSellorNot(int postNo){
		return dao.isSellorNot(postNo);
	}

	@Override
	public GalleryDTO getLoginInfo(String userId) {
		// 로그인 한 유저 정보 갖고오기 (user 테이블에 있는거)
		GalleryDTO loginInfo = dao.getLoginInfo(userId);
		loginInfo.setUserProfile(resource+loginInfo.getUserProfile());
		return loginInfo;
	}
	@Override
	public void likeUp(int postNo, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		
		dao.likeUp(map);
		
		//오빠 저 윤진인데 alarm 테이블 insert 여기서 했어요
		dao.insertLikeAlarm(map);
	}

	@Override
	public void likeDown(int postNo, String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		
		dao.likeDown(map);
		
		//alarm 테이블 delete 여기서 했어여!
		dao.deleteLikeAlarm(map);
	}
	
	@Override
	public Integer userNum(Map map) {
		return dao.userNum(map);
	}
	
	
	
	@Override
	public Integer findLike(int postNo, String userId) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		map.put("userId", userId);
		int counts= dao.findLike(map);
		return counts;
	}
	
	@Override
	public List findUserPostno(String userId) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		
		return dao.findUserPostno(map);
	}
	
	@Override
	public Integer getpostlikes(int postNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("postNo", postNo);
		return dao.getpostlikes(map);
	}

	@Override
	public void galleryComment(Map map) {
		//댓글 insert
		dao.insertComment(map);
		
		//댓글 alarm insert
		dao.insertCommentAlarm(map);
	}

	@Override
	public int findCart(Map map) {
		// 카트에서 count 가지고오기
		
		return dao.findCart(map);
	}

	@Override
	public void deleteCart(Map map) {
		dao.deleteCart(map);
		
	}

	@Override
	public void insertCart(Map map) {
		dao.insertCart(map);
		
	}

	@Override
	public int isMapAttached(int postNo) {
		// 지도 첨부 여부 확인하기
		return dao.isMapAttached(postNo);
	}

	@Override
	public GalleryDTO getMapInfo(int postNo) {
		
		return dao.getMapInfo(postNo);
	}

	@Override
	public int findCartinList(Map map) {
		return dao.findCartinList(map);
	}

	@Override
	public int findPdNo(Map map) {
		return dao.findPdNo(map);
	}

}
