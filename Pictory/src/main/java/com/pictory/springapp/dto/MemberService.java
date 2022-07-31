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
	
	
	public List<SavePostDTO> selectLikePost(int memberNo);
	
	public List<SavePostDTO> selectByePost(int memberNo);	
}
