package com.pictory.springapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
public class StroyConfig {
	
	@Bean
	public ObjectMapper objectMapper() {
		return new ObjectMapper();
	}//objectMapper()

}
