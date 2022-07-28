package com.pictory.springapp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminNoticeDTO {
	private int noticeNo;
	private int userNo;
	private int noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private int noticeCategory;
	private String userId;
}