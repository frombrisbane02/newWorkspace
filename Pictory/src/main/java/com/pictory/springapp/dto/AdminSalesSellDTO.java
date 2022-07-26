package com.pictory.springapp.dto;

import lombok.Data;

@Data
public class AdminSalesSellDTO {
	private int postNo;
	private String userId;
	private int paymentNo;
	private int pdNo;
	private String PhotoName;
	private String paymentTotal;
	private String paymentDate;
}
