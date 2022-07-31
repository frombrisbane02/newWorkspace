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
public class PaymentDTO {
	private int paymentNo;
	private int userNo;
	private Date paymentDate;
	private int paymentTotal;
}
