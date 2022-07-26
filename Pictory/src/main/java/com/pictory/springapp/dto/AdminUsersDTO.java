package com.pictory.springapp.dto;

import lombok.Data;

@Data
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
	private int enabled;
}
