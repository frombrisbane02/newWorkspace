package com.pictory.springapp.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MyCartDTO;
import com.pictory.springapp.dto.MyPageCartService;
import com.pictory.springapp.dto.PostDTO;
import com.pictory.springapp.dto.SavePostDTO;

@Service
public class MyPageCartServiceImpl implements MyPageCartService {

	@Autowired
	private MyCartDAO dao;
	
	@Override
	public List<MyCartDTO> selectMyCartDTO(String userId) {
		List<MyCartDTO> list = dao.selectMyCart(userId);
		
		
		
		List<MyCartDTO> result = list
				.stream()
				.map(cart -> {
						int price = cart.getPdPrice();
						Double commision = price * 0.1;
						cart.setCommision(commision.intValue());
						cart.setTotalPrice(price + cart.getCommision());
						return cart;
				})
				.collect(Collectors.toList());
		
		return result;
	}
	
	@Override
	public void deleteMyCart(int userNo) {
		dao.deleteMyCart(userNo);
	}

}
