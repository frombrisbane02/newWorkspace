package com.pictory.springapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.MyCartDTO;
import com.pictory.springapp.dto.MyPageCartService;

@Service
public class MyPageCartServiceImpl implements MyPageCartService {

	@Autowired
	private MyCartDAO dao;
	
	@Override
	public List<MyCartDTO> selectMyCartDTO(String userId) {
		List<MyCartDTO>  list = dao.selectMyProduct(userId);
		return list;
	}

}
