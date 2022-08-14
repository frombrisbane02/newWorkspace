package com.pictory.springapp.config;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FormCommand {

	//폼의 파라미터명과 같게 속성(멤버변수) 정의]
		private String userId;
		private String userName;
		private String userEmail;
		private String userPassword;
		private String password2;
}
