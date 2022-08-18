package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.SearchDTO;

@Repository("searchDAO")
public class SearchDAO {
	
	// - SqlSessionTemplate사용: 위 프로그래밍 순서 가, 나에서는 commit(), 다의 close()호출 불필요

	@Autowired
	private SqlSessionTemplate template;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();

	// 통합검색
	public List<SearchDTO> searchSelect(Map map) {
	
		//System.out.println("dao 들어왔냐"+map.get("searchName"));
		List<SearchDTO> result=template.selectList("searchSelect", map);
				for(SearchDTO oneResult : result) {
//					System.out.println("DAO포문 입장");
//					System.out.println("postno"+ oneResult.getPostNo());
//					System.out.println("userNickname"+ oneResult.getUserNickname());
					
					oneResult.setPhotoUrl(resource+oneResult.getPhotoUrl());
					if(!(oneResult.getUserProfile().contains("k.kakaocdn.net"))) {
						oneResult.setUserProfile(resource+oneResult.getUserProfile());
					}

					
//					  switch(oneResult.getPostCategory()) { 
//					  case "landscape":oneResult.setPostCategory("풍경"); break; 
//					  case "object":oneResult.setPostCategory("정물"); break; 
//					  case "figure":oneResult.setPostCategory("인물"); break; 
//					  default:oneResult.setPostCategory("기타"); break; 
//					  }
					 
				}
		return result;
	}

	// post 최신순 검색
	public List<SearchDTO> recentSearch(Map map) {

		return template.selectList("searchPostRecent", map);
	}

	public List<SearchDTO> getHashList() {
		//해시태그 가져오기
		return template.selectList("hashlist");
	}

	

	public int findCartinList(Map map) {
		return template.selectOne("findCartinList",map);
	}

	public int findPdNo(Map map) {
		return template.selectOne("findPdNo",map);
	}

	public void deleteCart(Map map) {
		template.delete("deleteCart",map);
	}

	public void insertCart(Map map) {
		template.insert("insertCart",map);		
	}

	//좋아요 체크
	public int searchLike(Map<String, Object> map) {
		int succ=0;
		succ=template.selectOne("searchLike", map);
		return succ;
	}

	public void deleteSearchLikeAlarm(Map<String, Object> map) {
		template.delete("deleteSearchLikeAlarm",map);
	}

	//좋아요 해제
	public void searchlikeDown(Map<String, Object> map) {
		template.selectOne("searchlikeDown", map);
		
	}

	public void searchlikeUp(Map<String, Object> map) {
		template.selectOne("searchlikeUp", map);
		
	}

	public void insertSearchLikeAlarm(Map<String, Object> map) {
		template.insert("insertSearchLikeAlarm", map);
	}

	public Integer getsearchlikes(Map map) {
		return template.selectOne("getsearchlikes", map);
	}
	



	
	//카테고리 검색
//	public List<SearchDTO> categorySelect(String postCategory) {
//		System.out.println("카테고리 DAO");
//		List<SearchDTO> tmps= template.selectList("categorySelect", postCategory);
//		for(SearchDTO tmp : tmps) {
//			tmp.setPhotoUrl(resource+tmp.getPhotoUrl());
//			tmp.setUserProfile(resource+tmp.getUserProfile());
//		}
//		 System.out.println("=====쿼리에서 가져온 값===:"+tmps);
//		 return tmps;
//	}

	

//	public List<SearchDTO> getCategoryList() {
//		//카테고리 가져오기
//		return template.selectOne("categorylist");
//	}

	

}
