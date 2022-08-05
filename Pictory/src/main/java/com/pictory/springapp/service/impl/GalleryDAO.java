package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;

@Repository("galleryDAO")
public class GalleryDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();

	
	//상단바-갤러리 클릭시 조회용
	public List<GalleryDTO> selectGalleryList() {
		//조회 시 photoUrl은 resource 빠져있으니까 그거 추가로 붙여서 저장해야함
		
		List<GalleryDTO> rawLists = template.selectList("galleryList");
		
		
		for(GalleryDTO rawList : rawLists) {
			
			rawList.setPhotoUrl(resource+rawList.getPhotoUrl());
			rawList.setUserProfile(resource+rawList.getUserProfile());
		}
		
		System.out.println("SET COMPLETED?: "+rawLists.get(0));
		
		return rawLists;
	}
	

	public List<GalleryDTO> selectPhotoList(int postNo) {
		
		System.out.println("DAO: 클릭한 postNo: "+postNo);
		
		// photoUrl 먼저 뽑아오기
		//List<Map<String, Object>> photoLists = new ArrayList<Map<String,Object>>();
		List<GalleryDTO> photoLists = template.selectList("photoList",postNo);
		
		for(GalleryDTO onePhoto : photoLists) {
			System.out.println("클릭한 post의 url"+onePhoto.getPhotoUrl());
		}
		return photoLists;
		
	}


	public List<GalleryDTO> selectGalleryView(int postNo) {
		System.out.println("dao 클릭한 postNo"+postNo);
		return template.selectList("galleryView",postNo);
	}


	public List<GalleryDTO> selectUserInfo(int postNo) {
		//작가 정보 뿌려주기 위한 서비스 호출
		List<GalleryDTO> userInfos = template.selectList("userInfo",postNo);
		for(GalleryDTO userInfo : userInfos) {
			userInfo.setUserProfile(resource+userInfo.getUserProfile());
		}
		
		return userInfos;
	}

	
	public List<GalleryDTO> selectFilter(String[] postCategory) {
		System.out.println("종근===갤러리 dao");
		return template.selectList("filter",postCategory);
	}

	public List<GalleryDTO> selectCommentList(int postNo) {
		// 댓글 목록 뿌려주기 위함
		
		List<GalleryDTO> comments = template.selectList("getComments", postNo);
		for(GalleryDTO oneComment : comments) {
			oneComment.setUserProfile(resource+oneComment.getUserProfile());
		}
		
		return comments;
	}


	public List<GalleryDTO> getHashList() {
		// 해시태그 갖고오기
		return template.selectList("hashlist");
	}


	public GalleryDTO getProductInfo(int postNo) {
		// 상품정보 가져오기
		GalleryDTO pdInfo = template.selectOne("getProductInfo",postNo);
		System.out.println("pdInfo 다 갖고왔니?"+pdInfo);
		return null;
	}
	
	public int isSellorNot(int postNo) {
		return template.selectOne("isSellorNot",postNo);
	}




}
