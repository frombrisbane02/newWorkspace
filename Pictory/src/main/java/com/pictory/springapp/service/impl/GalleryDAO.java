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
		
		return template.selectList("galleryList");
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
		return template.selectList("userInfo",postNo);
	}


	public List<GalleryDTO> selectCommentList(int postNo) {
		// 댓글 목록 뿌려주기 위함
		
		List<GalleryDTO> comments = template.selectList("getComments", postNo);
		for(GalleryDTO oneComment : comments) {
			System.out.println("===================================");
			System.out.println("dao: 댓글no: "+ oneComment.getCNo());
			System.out.println("dao: 댓글clevel: "+ oneComment.getCLevel());
			System.out.println("dao: 댓글text: "+ oneComment.getCText());
			System.out.println("dao: 댓글date: "+ oneComment.getCDate());
			System.out.println("dao: 댓글parentno: "+ oneComment.getParentCNo());
			System.out.println("===================================");
			
		}
		
		return template.selectList("getComments", postNo);
	}


	public List<GalleryDTO> getHashList() {
		// 해시태그 갖고오기
		return template.selectList("hashlist");
	}




}
