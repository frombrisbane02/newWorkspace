package com.pictory.springapp.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class AdminPaymentDTO {
	private String seller;
	private String consumer;
	private int paymentNo;
	private int pdNo;
	private String photoName;
	private int paymentTotal;
	private String paymentDate;
	private int persent;
	private String dateDay;
	
	private PageDTO pageDTO;
}
