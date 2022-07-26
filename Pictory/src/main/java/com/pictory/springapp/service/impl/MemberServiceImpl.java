package com.pictory.springapp.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
   @Autowired
   private MemberDAO dao;
   
   @Override
   public Boolean isLogin(Map map) {
      return dao.isLogin(map);
   }
   
    //회원정보보기
	@Override
	public MemberDTO readMember(String id) {
		MemberDTO dto = null;
		try {
		dto = dao.readMember(id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원정보수정 
	@Override
	public MemberDTO updateMember(MemberDTO dto) {
		try {
			dao.updateMember(dto);
			return dao.readMember(dto.getUserId());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int updateMemberPassword(MemberDTO dto) {

		try {
			dao.updateMemberPassword(dto);
		} catch (Exception e) {
			return 0;
		}
		return 1;
		
	}

}