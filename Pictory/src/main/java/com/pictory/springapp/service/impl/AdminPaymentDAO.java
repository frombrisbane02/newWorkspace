package com.pictory.springapp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.AdminCriteriaDTO;
import com.pictory.springapp.dto.AdminPaymentDTO;
import com.pictory.springapp.dto.PageDTO;

@Repository("adminpaymentDAO")
public class AdminPaymentDAO {
	
	@Autowired
	private SqlSessionTemplate template;
	

	// 최근 거래내역 총 갯수
	public int paymentTotalCount() throws Exception {
		try {
			
			int result = template.selectOne("paymentTotalCount");
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
			return 0;
	}
	
	// 최근거래내역 전체 LIST
	public List<AdminPaymentDTO> paymentList(AdminCriteriaDTO cri) throws Exception {
		
		
		try {
			
			List<AdminPaymentDTO> list = template.selectList("paymentList", cri);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return null;
	}
	
	
	// 검색 카운트
	public int paymentSearchCount(HashMap<String, Object> params) throws Exception {
		int result = 0;
		try {
			
			// 구매자
			if("CONSUMER".equals(params.get("choiceValue"))) {
				params.put("column", "a.consumer");
				
			// 판매자
			}else if("SELLER".equals(params.get("choiceValue"))) {
				params.put("column", "a.seller");
				
			// 주문번호
			}else if("ORDER".equals(params.get("choiceValue"))) {
				params.put("column", "a.PAYMENTNO");
				
			// 상품번호
			}else if("PRODUCT".equals(params.get("choiceValue"))) {
				params.put("column", "a.PDNO");
			}
			
			result = template.selectOne("paymentSearchCount", params);
			
			return result;
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
			
		return 0;
	}
	
	
	// 최근 거래내역 검색 리스트
	public List<AdminPaymentDTO> paymentSearch(HashMap<String, Object> params) throws Exception {
		
		try {
			
			// 구매자
			if("CONSUMER".equals(params.get("choiceValue"))) {
				params.put("column", "a.consumer");
				
			// 판매자
			}else if("SELLER".equals(params.get("choiceValue"))) {
				params.put("column", "a.seller");
				
			// 주문번호
			}else if("ORDER".equals(params.get("choiceValue"))) {
				params.put("column", "a.PAYMENTNO");
				
			// 상품번호
			}else if("PRODUCT".equals(params.get("choiceValue"))) {
				params.put("column", "a.PDNO");
			}
			
			List<AdminPaymentDTO> list = template.selectList("paymentSearch", params);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return null;
	}
	
	
	public List<AdminPaymentDTO> paymentChart(List<HashMap<String, Object>> params) throws Exception {
		
		try {
					
			Map<String, String> map = new HashMap<String, String>();
			
			for(int i = 0; i < params.size(); i++) {
				map.put("startDate", (String) params.get(i).get("startDate"));
				map.put("endDate", (String) params.get(i).get("endDate"));
			}
			
			List<AdminPaymentDTO> list = template.selectList("paymentChart", map);
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return null;
	}
}
