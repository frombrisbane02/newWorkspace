package com.pictory.springapp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminUsersDTO {
	private int userNo;
	private String userId;
	private String userPassword;
	private String userEmail;
	private String userName;
	private String userNickname;
	private int userFing;
	private int userFwer;
	private String userProfile;
	private String userSelf;
	private String userDate;
	private int enabled;
	private String dateDay; 
	private int totalCount;
}
