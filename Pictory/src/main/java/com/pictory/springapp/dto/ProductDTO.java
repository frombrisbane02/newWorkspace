package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ProductDTO {
	
	private int pdNo;
	
	private int photoNo;
	
	private int pdPrice;
	
	private int pdSaleNo;
	
	private Date pdDate;
}
