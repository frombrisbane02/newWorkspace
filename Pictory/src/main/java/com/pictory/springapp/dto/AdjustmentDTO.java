package com.pictory.springapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class AdjustmentDTO {
	private int adjNo;
	private int adjAmount;
	private String bank;
	private Date adjDate;
	private int userNo;
}
