package com.pictory.rest.config;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.VendorExtension;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2 //Swagger2 버전 활성화
public class SwaggerConfig {//http://192.168.0.27:5050/swagger-ui.html
	
	@Bean
	public Docket openApi() {//Docket : Swagger 설정의 핵심 클래스
		return new Docket(DocumentationType.SWAGGER_2)
				.select()//화면 구성을 위한 객체
				.apis(RequestHandlerSelectors.basePackage("com.pictory.rest.controller"))//API를 문서화하기 위한 Swagger를 적용할 패키지 설정
				.paths(PathSelectors.any())
				.build()
				.apiInfo(openApiInfo());
	}
	
	//Swagger UI 화면 정보 설정(제목, 설명 등 문서에 대한 정보)
	private ApiInfo openApiInfo() {
		/*
		return new ApiInfo(
				"REST API Documentation",
                "OpenApi 사용 설명서입니다",  
                "1.0",                                           
                "192.168.0.27:5050",
                new Contact("Shin Dong Mi","http://shin.com","shindong8264@nate.com"), 
                "SDM 2.0", 
                "https://springfox.github.io",
                new ArrayList<VendorExtension>());
                */
	
		return new ApiInfoBuilder()
				.title("REST API Documentation")
				.description("OpenApi 사용 설명서입니다")
				.version("1.0")
				.termsOfServiceUrl("192.168.0.27:5050")
				.contact(new Contact("Shin Dong Mi","http://shin.com","shindong8264@nate.com"))
				.license("SDM 2.0")
				.licenseUrl("https://springfox.github.io")
				.extensions(new ArrayList<VendorExtension>())
				.build();
	}

}
