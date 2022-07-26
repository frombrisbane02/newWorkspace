package com.pictory.springapp.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.pictory.springapp.dto.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {	
	
	@GetMapping("Index.do")
	public String index() {		
		return "admin/Index";
	}
	
	@RequestMapping("analysis/Index.do")
	public String anysisIndex() {
		return "admin/analysis/Index";
	}
	
	@RequestMapping("manager/Index.do")
	public String managerIndex() {
		return "admin/manager/Index";
	}
	
	



}