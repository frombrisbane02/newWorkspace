package com.pictory.springapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class SearchDTO {
	
	//각 테이블에서 필요하다 생각되는 요소들 작성했는데 맞는지...
	private int postSellorNot;
	private String postCategory;
	private String postTitle;
	private String textContent;
	private String hashtag;
}
