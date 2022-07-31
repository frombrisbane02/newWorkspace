package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SalesDTO {
	private int productNo;
	private Date soldDate;
	private String productName;
	private int profit;
	private int status;
}
