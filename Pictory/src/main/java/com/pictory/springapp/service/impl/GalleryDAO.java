package com.pictory.springapp.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.LikeDTO;

@Repository("galleryDAO")
public class GalleryDAO {
	
	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();


	
	//상단바-갤러리 클릭시 조회용
	public List<GalleryDTO> selectGalleryList(String userId) {
		//조회 시 photoUrl은 resource 빠져있으니까 그거 추가로 붙여서 저장해야함
		
		List<GalleryDTO> rawLists = template.selectList("galleryList");
		//리스트는 다 받아왔고, 각 postNo에 대한 user의 like를 가져와서 같이 저장할거임
		
		Map map = new HashMap();
		map.put("userId", userId);
		
		for(GalleryDTO rawList : rawLists) {
			
			
			map.put("postNo", rawList.getPostNo());
			int likeornot = template.selectOne("findLike",map);
			rawList.setLikeornot(likeornot);
			rawList.setPhotoUrl(resource+rawList.getPhotoUrl());
			rawList.setUserProfile(resource+rawList.getUserProfile());
			
			switch(rawList.getPostCategory()) {
				case "landscape": rawList.setPostCategory("풍경"); break;
				case "object": rawList.setPostCategory("정물"); break;
				case "figure": rawList.setPostCategory("인물"); break;
				default: rawList.setPostCategory("기타"); break;
			}
		}
		
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

	
	//2public List<GalleryDTO> selectFilter(String[] postCategory) 
		public List<GalleryDTO> selectFilter(String[] postCategory){
		System.out.println("종근===갤러리 dao");
		
		List<GalleryDTO> filters = template.selectList("filter",postCategory);
		for(GalleryDTO filter : filters) {
			filter.setPhotoUrl(resource+filter.getPhotoUrl());
			filter.setUserProfile(resource+filter.getUserProfile());
			
			switch(filter.getPostCategory()) {
			case "landscape": filter.setPostCategory("풍경"); break;
			case "object": filter.setPostCategory("정물"); break;
			case "figure": filter.setPostCategory("인물"); break;
			default: filter.setPostCategory("기타"); break;
		}
			
		}
		System.out.println("11======================");
		System.out.println("filters"+filters);
		return filters;
	}

	public List<GalleryDTO> selectCommentList(int postNo) {
		// 댓글 목록 뿌려주기 위함
		
		List<GalleryDTO> comments = template.selectList("getComments", postNo);
		for(GalleryDTO oneComment : comments) {
			if(!(oneComment.getUserProfile().contains("k.kakaocdn.net")))
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
		return pdInfo;
	}
	
	public int isSellorNot(int postNo) {
		return template.selectOne("isSellorNot",postNo);
	}


	public GalleryDTO getLoginInfo(String userId) {
		
		return template.selectOne("getLoginInfo", userId);
	}



	public int userNum(Map map) {
		return template.selectOne("findUserNo", map);
	}

	//좋아요 체크
	public int findLike(Map<String, Object> map) {
		System.out.println("###갤러리dao###");
		int succ=0;
		System.out.println("###DAO###:"+map);
		succ=template.selectOne("findLike", map);
		System.out.println("###succ###:"+succ);
		return succ;
		
	}

	//좋아요 해제
	public void likeDown(Map<String, Object> map) {
		System.out.println("###좋아요 해제DAO###");
		template.selectOne("likeDown", map);
		
	}


	public void likeUp(Map<String, Object> map) {
		System.out.println("###좋아요 업DAO###");
		template.selectOne("likeUp", map);
		
	}

	//갤러리리스트에서 로그인한 유저가 좋아요 버튼 누른 것들 표시
	public List findUserPostno(Map<String, Object> map) {
		
		System.out.println("###포스트넘버 체크DAO###");
		System.out.println("###포스트넘버 map###:"+map);
		List lists=template.selectList("findUserPostno",map);
		System.out.println("###tmp###:"+lists);
		return lists;
	}


	public void insertComment(Map map) {
		// 댓글 넣기전에 USERID로 USERNO 먼저 가져오기
		String userId = map.get("userId").toString();
		
		int userNo = template.selectOne("getUserNo",userId);
		map.put("userNo", userNo);
		map.put("parentCNo", null); //이거 걍 ...일단 다 null넣자 ㅠ 답글처리 못해잉
		
		template.insert("insertComment", map);
		
	}






}
