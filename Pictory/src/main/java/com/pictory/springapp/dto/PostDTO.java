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
	
	private int postNo;
	private int userNo;
	private String postTitle;
	private int postHits;
	private int postSellorNot;
	private String postCategory;
	private String postText;
	private int postLikes;
	private Date postDate;
	private String userId;
	
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
	
	//Story(등록하는경우)
	private int sNo;
	private String storyTitle;//20자
	private String storyDescription;//100자  

	/*comment(이거 분리할지..)
	private int cNo;
	private String cText;
	private int cLevel;
	private Date cDate;
	private int parentCNo;*/
	
}
