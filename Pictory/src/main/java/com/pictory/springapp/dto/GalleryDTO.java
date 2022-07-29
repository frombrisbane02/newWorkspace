package com.pictory.springapp.dto;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GalleryDTO {
	
	//List에 필요한 변수들(POST, PHOTO, USER 테이블)
	//목록: 카테고리, 제목, 해시태그, 첫번째 이미지(썸네일용), 좋아요수, 댓글 수, 닉네임
	
	private int postNo;
	private String postTitle;
	private int postHits;
	private int postSellorNot;
	private String postCategory;
	private String postText;
	private int postLikes;
	private Date postDate;
	private int commentCount;
	
	//user 정보
	private String userId;
	private int userNo;
	private String userProfile;
	private String userName;
	private int userFing;
	private int userFwer;
	
	
	//hashtag(등록하는경우)
	private String hashtag;
	
	//photo
	private int photoNo;
	private int photoSize;
	private String photoName;
	private String photoUrl;
	
	
	// 댓글용
	private int cNo;
	private String cText;
	private int cLevel;
	private Date cDate;
	private int parentCNo;
	
	
	//map용(등록하는경우)
	private int markerNo;
	private String markerName;
	private String markerLocation;
		

	//product(판매하는경우)
	private int pdNo;
	private int pdPrice;
	private int pdSalesNo;
	private Date pdDate;
	

	

	

}
