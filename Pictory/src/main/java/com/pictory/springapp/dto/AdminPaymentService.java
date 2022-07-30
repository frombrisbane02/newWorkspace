package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminPaymentService {
	public List<AdminPaymentDTO> paymentList() throws Exception;
	public List<AdminPaymentDTO> paymentSearch(HashMap<String, Object> params) throws Exception;
	public List<AdminPaymentDTO> paymentChart(List<HashMap<String, Object>> params) throws Exception;

}


