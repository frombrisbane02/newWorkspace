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
	
	//users
	private String userNickname;
	private String userId;
	private int userNo;
	
	//photo
	private int photoNo;  //사진고유번호
	private String photoUrl;    //사진 URL
	

}
