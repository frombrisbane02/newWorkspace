package com.pictory.springapp.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor   //룸복 기본생성자 
@AllArgsConstructor    //룸북 인자생성자
public class StoryDTO {

	//story
	private int sNo;
	private String storyThumbnail; //썸네일
	private String storyTitle;//20자
	private String storyDescription;//100자  

	//TBL_USERS
	private int userNo;
	private String userNickname;
	private String userId;
	private String userName;
	private String userProfile;

	//TBL_PHOTO
	private int photoNo;
	private String photoName;
	private String photoUrl;
	
	private String postCategory;
}
