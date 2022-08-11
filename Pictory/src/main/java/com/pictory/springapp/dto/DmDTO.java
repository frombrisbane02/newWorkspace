package com.pictory.springapp.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class DmDTO {
	
		private int dmNo;
		private int	dmRoom; 
		private String sendNick;
		private String readNick;
		private String sendTime;
		private String readTime;
		private String dmContent;
		private int readCheck;
		
		// 현재 사용자의 메세지 상대 nick을 담는다.
		private String otherNick;
		
		// 현재 사용자의 메세지 상대 profile을 담는다.
		private String userProfile;
		
		// 현재 사용자 nick
		private String userNickname;
		private String userId;
		// 안읽은 메세지 갯수 
		private int unread;
		
		
		
		
		
		
		
	
		
		
}
