package com.pictory.rest.service.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pictory.rest.service.GalleryDTO;

@Repository
public class GalleryDAO {
	
	
	@Autowired
	private SqlSessionTemplate template;

	public List<GalleryDTO> feedGalleryList(GalleryDTO dto) {
		return template.selectList("feedGalleryList",dto);
	}
	
	public List<GalleryDTO> galleryList(Map<String, String> map) {
		return template.selectList("galleryList",map);
	}
	
	public List<GalleryDTO> storyList(GalleryDTO dto) {
		return template.selectList("storyList",dto);
	}
	
	public List<GalleryDTO> storyPictureList(GalleryDTO dto) {
		return template.selectList("storyPictureList",dto);
	}
	
	public List<GalleryDTO> salesGalleryListTop() {
		return template.selectList("salesGalleryListTop");
	}
	
	public List<GalleryDTO> createrList(GalleryDTO dto) {
		return template.selectList("createrList",dto);
	}
	
	public List<GalleryDTO> salesGalleryList(GalleryDTO dto) {
		return template.selectList("salesGalleryList",dto);
	}
	
	public GalleryDTO galleryView(GalleryDTO dto) {
		return template.selectOne("galleryView",dto);
	}
	
	public List<GalleryDTO> galleryViewPhotoList(GalleryDTO dto) {
		return template.selectList("galleryViewPhotoList",dto);
	}
	
	public int updatePosthits(GalleryDTO dto) {		
		return template.update("updatePosthits",dto);
	}
	
	public int insertLikes(GalleryDTO dto) {
		return template.insert("insertLikes",dto);
	}
	
	public int deleteLikes(GalleryDTO dto) {
		return template.delete("deleteLikes",dto);
	}
	
	public List<GalleryDTO> cartList(GalleryDTO dto) {
		return template.selectList("cartList",dto);
	}
	
	public int deleteCart(GalleryDTO dto) {
		return template.delete("deleteCart",dto);
	}
	
	public int insertCart(GalleryDTO dto) {
		return template.insert("insertCart",dto);
	}
	
	public String insertPayment(Map<String,String> map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("insertPayment",map);
		//인자로 전달하는 Map에 새로 입력된 행의 키(번호)를 담을 수 있다
		return String.valueOf(map.get("paymentNo"));
	}
	
	public int insertPdorder(GalleryDTO dto) {
		return template.insert("insertPdorder",dto);
	}
	
	public int updatePdsalesno(GalleryDTO dto) {		
		return template.update("updatePdsalesno",dto);
	}
	
	public List<GalleryDTO> orderDayList(GalleryDTO dto) {
		return template.selectList("orderDayList",dto);
	}
	
	public List<GalleryDTO> orderList(GalleryDTO dto) {
		return template.selectList("orderList",dto);
	}
	
	public String insertPost(Map<String,String> map) {
		//마이바티스의 insert는 무조건 영향받은 행의 수 반환
		template.insert("insertPost",map);
		//인자로 전달하는 Map에 새로 입력된 행의 키(번호)를 담을 수 있다
		return String.valueOf(map.get("postNo"));
	}
	
	public GalleryDTO storyView(GalleryDTO dto) {
		return template.selectOne("storyView",dto);
	}

	public GalleryDTO creatorView(GalleryDTO dto) {
		return template.selectOne("creatorView",dto);
	}
	
	public int insertFollow(GalleryDTO dto) {
		return template.insert("insertFollow",dto);
	}
	
	public int deleteFollow(GalleryDTO dto) {
		return template.delete("deleteFollow",dto);
	}

}
