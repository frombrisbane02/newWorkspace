package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminPaymentService {
	
	public List<AdminPaymentDTO> paymentList(AdminCriteriaDTO cri) throws Exception;
	
	
	public List<AdminPaymentDTO> paymentSearch(HashMap<String, Object> params) throws Exception;
	public List<AdminPaymentDTO> paymentChart(List<HashMap<String, Object>> params) throws Exception;
	
	// 전체 카운트
	public int paymentTotalCount() throws Exception;
	// 검색 카운트
	public int paymentSearchCount(HashMap<String, Object> params) throws Exception;

}
