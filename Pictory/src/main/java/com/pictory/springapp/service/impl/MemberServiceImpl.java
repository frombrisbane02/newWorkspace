package com.pictory.springapp.service.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService<MemberDTO>{
	@Autowired
	private MemberDAO dao;
	
	//로그인
	@Override
	public String isLogin(Map map) {
	
		return dao.isLogin(map);
	}

	public boolean isExist(String userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		System.out.println("@@@@@");
		return dao.isExist(map);
	}
	//회원가입
	@Override
	public int signUp(MemberDTO dto) {
		int resultCnt=0;
		resultCnt = dao.signUp(dto);
		System.out.println("에러후 여기로 들어오나요???resultCnt:"+resultCnt);
		return resultCnt;
		
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
