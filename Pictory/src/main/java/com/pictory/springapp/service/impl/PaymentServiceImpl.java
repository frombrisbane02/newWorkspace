package com.pictory.springapp.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pictory.springapp.dto.AdjustmentDTO;
import com.pictory.springapp.dto.OrderDTO;
import com.pictory.springapp.dto.PaymentDTO;
import com.pictory.springapp.dto.PaymentService;
import com.pictory.springapp.dto.SalesDTO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO dao;
	
	@Autowired
	private MyCartDAO cartDao;
	
	
	@Transactional
	@Override
	public void payment(int userNo, List<Integer> list, int total) {
		
		int sequence = dao.selectSeauence(); 
		PaymentDTO dto = new PaymentDTO(sequence, userNo, new Date(System.currentTimeMillis()), total);		
		dao.insertPayment(dto);
		
		for(Integer p : list)
			dao.insertOrder(new OrderDTO(sequence, p));
		
		cartDao.deleteMyCart(userNo);
	}



	@Override
	public List<SalesDTO> selectMySales(int userNo) {
		List<SalesDTO> list = dao.selectMySales(userNo);
		return list;
	}


	@Override
	public void insertAdjustment(AdjustmentDTO dto) {
		dao.insertAdjustment(dto);
		
	}



	@Override
	public List<AdjustmentDTO> selectAdjustment(int userNo) {
		List<AdjustmentDTO> list = dao.selectAdjustment(userNo);
		return list;
	}

}
