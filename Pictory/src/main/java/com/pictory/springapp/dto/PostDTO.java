package com.pictory.springapp.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PostDTO {
	
	//TBL_POST
	private int postNo;
	private String postTitle;
	private int postHits;
	private int postSellorNot;
	private String postCategory;
	private String postText;
	private int postLikes;
	private Date postDate;

	

	//TBL_STORY
	private int sNo;
	private String storyThumbnail;
	private String storyTitle;
	private String storyDescription;

	
	//TBL_USERS
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
	private Date userDate;
	
	//파일 서버 업로드용
	private MultipartFile upload;
	
	//private int commentCount;
	
	//photo
	private int photoNo;
	private int photoSize;
	private String photoName;
	private String photoUrl;
	
	//map용(등록하는경우)
	private int markerNo;
	private String markerName;
	private String markerLocation;
		
	//hashtag(등록하는경우)
	private String hashtag;
	
	//product(판매하는경우)
	private int pdNo;
	private int pdPrice;
	private int pdSalesNo;
	private Date pdDate;
	

	/*comment(이거 분리할지..)
	private int cNo;
	private String cText;
	private int cLevel;
	private Date cDate;
	private int parentCNo;*/
	
}
