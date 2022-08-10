package com.pictory.springapp.controller.mypage;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.GalleryDTO;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.SavePostDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageSaveController {

	@Autowired
	private MemberService memberService;
	
	String resource = Constants.RESOURCE.toString();
	
	@RequestMapping("Like.do")
	public String save(HttpSession session, Model model) {
		System.out.println("마이페이지 내가 좋아요 한 사진 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectLikePost(member.getUserNo());
		for(SavePostDTO dtos : dto) {
			dtos.setPhotoUrl(resource+dtos.getPhotoUrl());
			dtos.setPostUserProfile(resource+dtos.getPostUserProfile());
		}
		model.addAttribute("likePostList", dto);
		
		return "mypage/MypageLike.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="LikeDelete.do",method=RequestMethod.GET)
	public String  nDeleteGet(int postNo) {
		System.out.println("LikeDelete 컨트롤러 들어옴?? "+postNo);
		memberService.deleteLikePost(postNo);
		return "redirect:/mypage/Like.do";
	}
	
	@RequestMapping("Buy.do")
	public String buy(HttpSession session, Model model) {
		System.out.println("마이페이지 내가 산 사진 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		List<SavePostDTO> dto = memberService.selectBuyPost(member.getUserNo());
		for(SavePostDTO dtos : dto) {
			dtos.setPhotoUrl(resource+dtos.getPhotoUrl());
			dtos.setPostUserProfile(resource+dtos.getPostUserProfile());
		}
		model.addAttribute("BuyPostList", dto);
		
		return "mypage/MypageBuy.tiles";
	}
	
	@GetMapping("/download.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response, @RequestParam("name") String name) throws Exception {
		
		//http://localhost:4040/springapp/upload/img/KIM/KKK.JPG
		String[] names=name.split("/");
		System.out.println("파일명:"+names[names.length-1]);
		System.out.println("다운로드 경로:"+String.format("/%s/%s/%s", names[4],names[5],names[6]));
		
		FileUpDownUtils.download(request, response, names[names.length-1], String.format("/%s/%s/%s", names[4],names[5],names[6]));
		
	}///fileDownload

}//////class 











