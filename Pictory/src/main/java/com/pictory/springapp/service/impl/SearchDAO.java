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
	@Autowired
	private SqlSessionFactory sqlMapper;
	// - SqlSessionTemplate사용: 위 프로그래밍 순서 가, 나에서는 commit(), 다의 close()호출 불필요

	@Autowired
	private SqlSessionTemplate template;
	
	//url 저장용 상수
	String resource = Constants.RESOURCE.toString();

	// 통합검색
	public List<SearchDTO> searchSelect(Map map) {
	
		System.out.println("dao 들어왔냐"+map.get("searchName"));
		List<SearchDTO> result=template.selectList("searchSelect", map);
				for(SearchDTO oneResult : result) {
					System.out.println("DAO포문 입장");
					System.out.println("postno"+ oneResult.getPostNo());
					System.out.println("userNickname"+ oneResult.getUserNickname());
					oneResult.setPhotoUrl(resource+oneResult.getPhotoUrl());
					oneResult.setUserProfile(resource+oneResult.getUserProfile());
					
					switch(oneResult.getPostCategory()) {
					case "landscape": oneResult.setPostCategory("풍경"); break;
					case "object": oneResult.setPostCategory("정물"); break;
					case "figure": oneResult.setPostCategory("인물"); break;
					default: oneResult.setPostCategory("기타"); break;
					}
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
//	// 카테고리별 검색
//	public List<SearchDTO> categorySelect(Map map) {
//		
//		return template.selectList("categorySelect", map)
//	}
	
	//카테고리 검색
	public List<SearchDTO> categorySelect(Map map) {
		System.out.println("카테고리 DAO");
		List<SearchDTO> tmp= template.selectList("categorySelect", map);
		 System.out.println("쿼리에서 가져온 값:"+tmp);
		 return tmp;
	}

	

//	public List<SearchDTO> getCategoryList() {
//		//카테고리 가져오기
//		return template.selectOne("categorylist");
//	}

	

}
