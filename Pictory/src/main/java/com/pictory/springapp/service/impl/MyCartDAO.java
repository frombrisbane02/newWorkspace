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
	
	public List<MyCartDTO> selectMyCart(String userId) {
		
		List<MyCartDTO> list = template.selectList("selectMyCart", userId);
		return list;
	}
	
	public void deleteMyCart(int postNo) {
		template.delete("deleteMyCart", postNo);
	}
}
