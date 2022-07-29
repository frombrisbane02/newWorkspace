package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.StoryDTO;


/*
[프로그래밍 순서]
가. SqlSessionFactory타입의 openSession() method로 sqlsession타입 얻기
나. SqlSession타입 Method호출
	.쿼리문 select     다중레코드: selectList()   ///    단일레코드: selectOne()
	.쿼리문 INSERT - insert()  ///    DELETE - delete()       ///     UPDATE - update()
	단, I/D/U는 반드시 commit()호출
다. close() 호출    */
@Repository("storyDAO")
public class StoryDAO<T> {

	@Autowired
	private SqlSessionFactory sqlMapper;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<StoryDTO> virtualList() {
		
		System.out.println("dao까지는...왔니?");
		
		return template.selectList("virtuallist");
		
	}

	
	/*====================0726
	public List<StoryDTO> virtualImages(List<StoryDTO> returnValue) {
		
		System.out.println("virtualImages 맞나요?");
		
		//dto에 같이 넘어오는값: sNo, 썸네일, storyTitle, Description
		//SELECT photoURL FROM PHOTO WHERE sNo=?인 postNo를 모두 찾고, 그 다음에 photourl싹 긁어오기
		//1) sNo 정보로 postNo 다 가져오기
		//sNo:getPostNo() - 1,3,5
		
		List<StoryDTO> virtualImages = template.selectList("virtualImages",returnValue);
		//2) postNo 들어간 photoUrl 다 가져오기
		
		for(StoryDTO virtualImage : virtualImages ) {			
			
			System.out.println("가지고온 sNo: "+virtualImage.getSNo());
			//System.out.println("가지고온 photoUrl: "+virtualImage.getPhotoUrl());	
		}
		return virtualImages;
	}*/
	
	public List<StoryDTO> virtualImages() {
		
		System.out.println("virtualImages");
		
		return template.selectList("virtualimages");
		
	}
	
	
}
