package com.pictory.springapp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminQnaDTO {
	private int qnaNo;
	private int userNo;
	private String qnaTitle;
	private String qnaContent;
	private String qnaDate;
	private String userId;
	private String answerText;
	private String answerDate;
}
