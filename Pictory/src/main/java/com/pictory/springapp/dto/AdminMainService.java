package com.pictory.springapp.dto;

import java.util.HashMap;
import java.util.List;

public interface AdminMainService {
	public List<AdminPaymentDTO> adminPaymentList() throws Exception;
	public List<AdminNoticeDTO> adminNoticeList() throws Exception;
	public List<AdminQnaDTO> adminQnaList() throws Exception;
	public List<AdminPaymentDTO> adminPaymentChart(List<HashMap<String, Object>> params) throws Exception;
	public List<AdminUsersDTO> adminUsersChart(List<HashMap<String, Object>> params) throws Exception;
	public List<AdminGalleryDTO> adminGalleryChart(List<HashMap<String, Object>> params) throws Exception;
}
