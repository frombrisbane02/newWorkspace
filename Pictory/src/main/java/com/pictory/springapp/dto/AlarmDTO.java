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
public class AlarmDTO {
	
	private int alarmNo;
	private String receiveUser;
	private String alarmType;
	private Date alarmDate;
	private boolean isChecked;
	private String receiver;
	private String subject;
	private String content;
	private String eventUser;

}
