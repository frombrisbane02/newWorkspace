package com.pictory.springapp.dto;

import java.util.List;

public interface PaymentService {

	void payment(int userNo, List<Integer> productNo, int total);
	
	List<SalesDTO> selectMySales(int userNo);
	
	void insertAdjustment(AdjustmentDTO dto);
	
	List<AdjustmentDTO> selectAdjustment(int userNo);
}
