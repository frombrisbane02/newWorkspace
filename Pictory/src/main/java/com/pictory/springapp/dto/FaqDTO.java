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
public class FaqDTO {
	
	private String userId;
	private int qnaNo;
	private int userNo;
	private int qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private int qnaCategory;
	
	
	
	//@Builder 어노테이션 사용하면 toString() 필요 없음
	/*
	@Override
	public String toString() {
		return "MemberDTO [userId="+userId+", userPassword="+userPassword+",userEmail="+userEmail+",userName="+userName+",userNickname="+userNickname+"]";
	}*/
}
