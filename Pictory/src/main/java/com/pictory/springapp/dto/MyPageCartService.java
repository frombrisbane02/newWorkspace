package com.pictory.springapp.dto;

import java.util.List;

public interface MyPageCartService {

	List<MyCartDTO> selectMyCartDTO(String userId);
	
	void deleteMyCart(int userNo);
}
