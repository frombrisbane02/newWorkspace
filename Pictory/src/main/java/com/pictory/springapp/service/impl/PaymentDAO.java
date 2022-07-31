package com.pictory.springapp.service.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.springapp.dto.OrderDTO;
import com.pictory.springapp.dto.PaymentDTO;
import com.pictory.springapp.dto.SalesDTO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate template;
	
	public int selectSeauence( ) {
		return template.selectOne("selectSequence");
	}
	
	public int insertPayment(PaymentDTO dto) {
		return template.insert("insertPayment", dto);
	}
	
	public int insertOrder(OrderDTO dto) {
		return template.insert("insertOrder", dto);
	}
	
	public List<SalesDTO> selectMySales(int userNo) {
		return template.selectList("selectMySales", userNo);
	}
}
