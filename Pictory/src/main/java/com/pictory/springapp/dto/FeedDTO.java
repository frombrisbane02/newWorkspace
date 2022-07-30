package com.pictory.springapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class FeedDTO {
	private int userNo;
	private String userNickname;
	private String userSelf;
	private int userFwer;
	private int userFing;
	private String userProfile;
	private String storyThumbnail;
	private String userId;
	private String userName;
}
