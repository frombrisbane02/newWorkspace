package com.pictory.springapp.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DmDTO {
	
	private String msgNo;
	private String sUserNo;
	private String rUserNo;
	private String msgCode;
	private String msgSend ;
	private String msgRead;
	private String msgContent;

}
