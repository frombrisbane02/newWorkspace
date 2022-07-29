package com.pictory.rest.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UsersDTO {
	private String userNo;
	private String userId;
	private String userPassword;
	private String userEmail;
	
	private String userName;
	private String userNickname;
	private String userFing;
	private String userFwer;
	private String userProfile;
	private String userSelf;
}
