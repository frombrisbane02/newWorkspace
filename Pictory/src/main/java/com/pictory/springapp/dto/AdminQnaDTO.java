package com.pictory.springapp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminQnaDTO {
	private int qnaNo;
	private int userNo;
	private int qnaCode;
	private String qnaTitle;
	private String qnaContent;
	private String qnaDate;
	private int qnaCategory;
	private String userId;
}
