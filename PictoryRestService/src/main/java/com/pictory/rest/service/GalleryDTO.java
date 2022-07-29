package com.pictory.rest.service;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class GalleryDTO {
	
	//USERS
	private String userNickname;
	private String userProfile;
	
	//POST
	private String postNo;
	private String userNo;
	private String sNo;
	private String postTitle;
	private String postHits;		
	private String postSellOrNot;
	private String postCategory;
	private String postText;
	private String postLikes;
	private java.sql.Date postDate;
	
	//PHOTO
	private String photoNo;
	private String photoSize;
	private String photoName;
	private String photoUrl;
	
	//STORY
	private String storyTitle;
	private String storyThumbnail;
	private String storyDescription;
	
	//COMMENT_TBL count 
	private String commentCnt;
	
	
}
