package com.pictory.springapp.dto;

import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class GalleryDTO {
	
	//List에 필요한 변수들(POST, PHOTO, USER 테이블)
	//목록: 카테고리, 제목, 해시태그, 첫번째 이미지(썸네일용), 좋아요수, 댓글 수, 닉네임
	//TBL_POST
	private int postNo;
	private String postTitle;
	private int postHits;
	private int postSellorNot;
	private String postCategory;
	private String postText;
	private int postLikes;
	private Date postDate;
	
	
	//글 총합 저장용
	private int postCount;
	
	//좋아요 눌렀는지 0, 1 저장용
	private int likeornot;
	
	//카트 담았는지 0,1 저장용
	private int cartornot;

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
	
	
	//TBL_HASHTAG
	private String hashtag;
	
	//TBL_PHOTO
	private int photoNo;
	private int photoSize;
	private String photoName;
	private String photoUrl;
	
	
	//TBL_COMMENT
	private int commentCount; //count용
	private int cNo;
	private String cText;
	private int cLevel;
	private Date cDate;
	private int parentCNo;
	
	//TBL_FOLLOW
	private int followTargetId;
	
	
	//map용(등록하는경우)
	private int markerNo;
	private String markerName;
	private String markerLocation;
		

	//product(판매하는경우)
	private int pdNo;
	private int pdPrice;
	private int pdSalesNo;
	private Date pdDate;
	
	//PAYMENT
	private int paymentNo;
	private Date paymentDate;
	private int paymentTotal;
	

	

	

}
