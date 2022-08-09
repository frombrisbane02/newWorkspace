package com.pictory.springapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SavePostDTO {

	private int postNo;
	
	private String photoName;
	
	private String postUserProfile;
	
	private String photoUrl;	
	
	private String postUserNickName;
}
