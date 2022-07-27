package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.SearchDTO;

@Repository("searchDAO")
public class SearchDAO {
	@Autowired
	private SqlSessionFactory sqlMapper;
	// - SqlSessionTemplate사용: 위 프로그래밍 순서 가, 나에서는 commit(), 다의 close()호출 불필요

	@Autowired
	private SqlSessionTemplate template;

	// 통합검색
	public List<SearchDTO> select(Map map) {

		return template.selectList("searchSelect", map);
	}

	// post 최신순 검색
	public List<SearchDTO> recentSearch(Map map) {

		return template.selectList("searchPostRecent", map);
	}

	// 총 검색 건수
	public List<SearchDTO> totalSearchCount(Map map) {

		return template.selectList("totalSearchCount", map);
	}

	// 카테고리별 검색
	public List<SearchDTO> categorySelect(Map map) {

		return template.selectList("categorySelect", map);
	}

	

}
