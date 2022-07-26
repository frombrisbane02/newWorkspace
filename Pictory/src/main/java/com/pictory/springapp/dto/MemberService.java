package com.pictory.springapp.dto;

import java.util.Map;

public interface MemberService {
	//로그인 용]
	Boolean isLogin(Map map);
	
	//회원정보 보기
	public MemberDTO readMember(String id);
		
	//회원정보 수정
	public MemberDTO updateMember(MemberDTO dto);
	
	//회원 비밀번호 수정
	public int updateMemberPassword(MemberDTO dto);

}
