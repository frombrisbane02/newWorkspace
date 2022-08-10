package com.pictory.springapp.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminPaymentDTO {
	private String seller;
	private String consumer;
	private int paymentNo;
	private int pdNo;
	private String postTitle;
	private String photoName;
	private String photoUrl;
	private int paymentTotal;
	private String paymentDate;
	private int persent;
	private String dateDay;
	private int rNum;
	private int totalCount;
//	private PageDTO pageDTO;	
}
