package com.pictory.springapp.dto;

import java.util.List;

public interface PaymentService {

	void payment(int userNo, List<Integer> productNo, int total);
	
	void calculate(int userNo, List<Integer> productNo);
	
	List<SalesDTO> selectMySales(int userNo);
}
