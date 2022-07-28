package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {
	
	private int noticeno;
	private int userno;
	private int noticecode;
	private String noticetitle;
	private String noticecontent;
	private Date noticedate;
	private int noticecategory;
	
	
	
	//@Builder 어노테이션 사용하면 toString() 필요 없음
	/*
	@Override
	public String toString() {
		return "MemberDTO [userId="+userId+", userPassword="+userPassword+",userEmail="+userEmail+",userName="+userName+",userNickname="+userNickname+"]";
	}*/
}
