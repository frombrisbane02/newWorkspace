package com.pictory.springapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyCartDTO {
	private String userId;
	private String userNickName;
	private int pdNo;
	private int photoNo;
	private int pdPrice;
	private int commision;
	private int totalPrice;
	private String photoName;
	private String photoUrl;
}
