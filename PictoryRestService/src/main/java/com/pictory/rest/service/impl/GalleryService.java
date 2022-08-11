package com.pictory.rest.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import com.pictory.rest.service.GalleryDTO;

@Service("galleryService")
public class GalleryService {
	
	@Autowired
	private GalleryDAO dao;

	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {		
		return dao.feedGalleryList(dto);
	}
	
	public List<GalleryDTO> galleryList(Map<String, String> map) {		
		return dao.galleryList(map);
	}
	
	public List<GalleryDTO> storyList(GalleryDTO dto) {		
		return dao.storyList(dto);
	}
	
	public List<GalleryDTO> storyPictureList(GalleryDTO dto) {		
		return dao.storyPictureList(dto);
	}
	
	public List<GalleryDTO> salesGalleryListTop() {		
		return dao.salesGalleryListTop();
	}
	
	public List<GalleryDTO> createrList(GalleryDTO dto) {		
		return dao.createrList(dto);
	}
	
	public List<GalleryDTO> salesGalleryList(GalleryDTO dto) {		
		return dao.salesGalleryList(dto);
	}
	
	public GalleryDTO galleryView(GalleryDTO dto) {		
		return dao.galleryView(dto);
	}
	
	public List<GalleryDTO> galleryViewPhotoList(GalleryDTO dto) {		
		return dao.galleryViewPhotoList(dto);
	}
	
	public int updatePosthits(GalleryDTO dto) {
		return dao.updatePosthits(dto);
	}
	
	public int insertLikes(GalleryDTO dto) {
		return dao.insertLikes(dto);
	}
	
	public int deleteLikes(GalleryDTO dto) {
		return dao.deleteLikes(dto);
	}
	
	public List<GalleryDTO> cartList(GalleryDTO dto) {		
		return dao.cartList(dto);
	}
	
	public int deleteCart(GalleryDTO dto) {
		return dao.deleteCart(dto);
	}
	
	public int insertCart(GalleryDTO dto) {
		return dao.insertCart(dto);
	}
	
	public boolean orderCompleted(String userNo, String paymentTotal, Map<String,String> dtoList) {
		
		System.out.println("userNo11:"+userNo);
		System.out.println("paymentTotal11:"+paymentTotal);
		System.out.println("dto갯수11:"+dtoList.size());
		
		GalleryDTO dto = new GalleryDTO();	
		//주문테이블 입력
		Map<String,String> map = new HashMap<String, String>();
		map.put("userNo", userNo);
		map.put("paymentTotal", paymentTotal);
		String paymentNo = dao.insertPayment(map);
		int sucess = 0;
		for(int i=0; i < dtoList.size(); i++) {
			String pdNo = dtoList.get("order"+i);			
			if(pdNo != null && !pdNo.equals("")) {
				System.out.println("pdNo:"+ pdNo);				
				dto.setPaymentNo(paymentNo);
				dto.setPdNo(pdNo);				
				dto.setUserNo(userNo);
				//물품주문 상세 입력			
				dao.insertPdorder(dto);
				//상품의 구매수 업데이트
				dao.updatePdsalesno(dto);
				//장바구니 삭제				
				sucess = dao.deleteCart(dto);
			}	
		}
		return sucess > 0 ? true:false;
	}	
	
	public List<GalleryDTO> orderDayList(GalleryDTO dto) {		
		return dao.orderDayList(dto);
	}
	
	public List<GalleryDTO> orderList(GalleryDTO dto) {		
		return dao.orderList(dto);
	}	
	
	public String insertPost(Map<String,String> map) {
		return dao.insertPost(map);
	}
	
	public GalleryDTO storyView(GalleryDTO dto) {		
		return dao.storyView(dto);
	}
	
	public GalleryDTO creatorView(GalleryDTO dto) {		
		return dao.creatorView(dto);
	}

}
