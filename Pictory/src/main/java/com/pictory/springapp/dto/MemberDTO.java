package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor

public class MemberDTO {
	
	private int userNo;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userName;
	private String userNickname;
	private String userFing;
	private String userFwer;
	private String userProfile;
	private String userSelf;
	private Date userDate;
	
	private int enabled;
	
	//@Builder 어노테이션 사용하면 toString() 필요 없음
	/*
	@Override
	public String toString() {
		return "MemberDTO [userId="+userId+", userPassword="+userPassword+",userEmail="+userEmail+",userName="+userName+",userNickname="+userNickname+"]";
	}*/
}
