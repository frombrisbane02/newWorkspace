package com.pictory.springapp.dto;

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
public class AdminUsersDTO {

	private int rNum;
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
	private String userDate;
	private int enabled;
	private String dateDay; 
	private int totalCount;
}
