package com.pictory.springapp.controller.mypage;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@SessionAttributes({"userId"})
@Controller
@RequestMapping("/mypage")
public class MypageProfileController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("Profile.do")
	public String index(HttpSession session, Model model) {
		System.out.println("마이페이지 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		
		if (id == null) {
			return "auth/Login";
		} else {
			//서비스안의 회원정보보기 메서드 호출
			MemberDTO dto = service.readMember(id);
			
			//정보저장 후 페이지 이동
			model.addAttribute("memDTO",dto);
			
			if (dto.getUserProfile() == null) {
				dto.setUserProfile("test_icon06.png");
			}
			
			return "mypage/MypageProfile.tiles";
		}

		
	}
	
	@RequestMapping(value="password.do", method = RequestMethod.POST)
	@ResponseBody
	public int editPassword(@RequestParam("pw") String pw, HttpSession session) {
		
		String id = (String) session.getAttribute("userId");
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setUserPassword(pw);
		memberDTO.setUserId(id);
		
		int result = service.updateMemberPassword(memberDTO);
		
		return result;
		
	}
	
	@RequestMapping(value="updateProfile.do", method = RequestMethod.POST)
	public String editProfile(HttpServletRequest req, @RequestParam("image") MultipartFile file, MemberDTO memberDTO, HttpSession session, Model model) throws IllegalStateException, IOException {
		
		
		String id = (String) session.getAttribute("userId");
		
		
		if (file != null) {
			String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources/img/mypage");
			String fileName = file.getOriginalFilename();
			String realFileName = id + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			String imgUploadPath = uploadPath + File.separator + realFileName;
			
			file.transferTo(new File(imgUploadPath));
			memberDTO.setUserProfile(realFileName);
		}
		
		memberDTO.setUserId(id);
		
		MemberDTO memberDTO2 = service.updateMember(memberDTO);

		model.addAttribute("memDTO",memberDTO2);
		
		return "redirect:/mypage/Index.do";
		
	}
	
	//페이지 이동 
	@RequestMapping("Index.do")
	public String profile() {
		System.out.println("마이페이지 컨트롤러");
		
		return "mypage/MypageIndex.tiles";
	}
	
	//회원 정보 조회 
	@RequestMapping(value = "/ProfileIndex.do", method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception{

		//세션 객체 안에 있는 ID정보 저장
		String id = (String) session.getAttribute("userId");
		
		//서비스안의 회원정보보기 메서드 호출
		MemberDTO dto = service.readMember(id);

		//정보저장 후 페이지 이동
		model.addAttribute("memDTO",dto);
	}
}
