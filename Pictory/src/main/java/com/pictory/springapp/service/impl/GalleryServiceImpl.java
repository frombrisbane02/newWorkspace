package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.GalleryService;

@Service("galleryService")
public class GalleryServiceImpl implements GalleryService<GalleryDTO> {
	
	@Autowired
	private GalleryDAO dao;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();

	@Override
	public List<GalleryDTO> galleryList() {
		//필요 인자: 카테고리, 해시태그, 첫번째 이미지 url(썸네일용), 좋아요수, 댓글 수, 유저프사, 유저닉네임
		
		return dao.selectGalleryList();
	}
	
	@Override
	public List<GalleryDTO> galleryPhoto(int postNo) {
		System.out.println("Impl.1 클릭한 postNo: "+postNo);
		
		return dao.selectPhotoList(postNo);
	}

	@Override
	public List<GalleryDTO> galleryView(int postNo) {
		System.out.println("Impl.2 클릭한 postNo: "+postNo);
		
		return dao.selectGalleryView(postNo);
	}

	@Override
	public List<GalleryDTO> galleryInfo(int postNo) {
		//작가 정보 뿌려주기위한 글
		return dao.selectUserInfo(postNo);
	}
	

	@Override
	public List<GalleryDTO> galleryFilter(String[] postCategory) {
		System.out.println("종근===갤러리 서비스 임풀");
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



}
