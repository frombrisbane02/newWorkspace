package com.pictory.springapp.dto;

import java.util.List;
import java.util.Map;

public interface MemberService<T> {
	
	
	//로그인 용]
	String isLogin(Map map);
	
	public boolean isExist(String id);
	
	//회원가입
	public int signUp(MemberDTO dto);
	
	//회원정보 보기
	public MemberDTO readMember(String id);
		
	//회원정보 수정
	public MemberDTO updateMember(MemberDTO dto);
	
	//회원 비밀번호 수정
	public int updateMemberPassword(MemberDTO dto);
	
	//좋아요 포스트 조회
	public List<SavePostDTO> selectLikePost(int memberNo);
	
	//구매한 포스트 조회	
	public List<SavePostDTO> selectBuyPost(int memberNo);	
	
	//좋아요 저장소에서 취소
	void deleteLikePost(int postNo);

	Integer getEnabled(Map map);
}
