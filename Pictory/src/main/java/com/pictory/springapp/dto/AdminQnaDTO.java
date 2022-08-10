package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminQnaDTO {
	private int rnum;
	private int qnaNo;
	private int userNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaDate;
	private String userId;
	private String answerText;
	private String answerDate;
	
	private int alarmNo;
	private String alarmType;
	private Date alarmDate;
	private int isChecked;
	private int receiver;
	private int eventUser;
	private String subject;
	private String content;
}
