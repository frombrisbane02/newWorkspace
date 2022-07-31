package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.MyCartDTO;

@Repository("myCartDAO")
public class MyCartDAO {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<MyCartDTO> selectMyCart(String id) {
		
		
		List<MyCartDTO> list = template.selectList("selectMyCart", id);
		System.out.println("dao에서 호출해 가져온 리스트 사이즈 MyCartDTO :"+list.size());
		return list;
	}
	
	public void deleteMyCart(int userNo) {
		template.delete("deleteMyCart", userNo);
	}
}
