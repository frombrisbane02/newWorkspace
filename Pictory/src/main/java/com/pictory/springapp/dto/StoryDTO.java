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
@NoArgsConstructor
@AllArgsConstructor
public class StoryDTO {

	private int sNo;
	private String storyThumbnail; //300
	private String storyTitle;//20자
	private String storyDescription;//100자  
	private String userNickname;
	private String userId;
	private int userNo;
	private int photoNo;  //사진고유번호
	private String photoUrl;
	

}
