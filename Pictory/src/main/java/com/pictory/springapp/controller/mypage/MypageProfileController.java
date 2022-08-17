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

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;

@SessionAttributes({"userId"})
@Controller
@RequestMapping("/mypage")
public class MypageProfileController {

	@Autowired
	private MemberService service;
	
	String resource = Constants.RESOURCE.toString();
	
	//탑에서 마이페이지로 들어왔을 때 첫 컨트롤러
	@RequestMapping("Index.do")
	public String profile(HttpSession session) {
		
		
		String id = (String) session.getAttribute("userId");
		if (id == null) {
			return "auth/Login.tiles";
		}
		return "redirect:/mypage/Profile.do";
	}
	
	//마이페이지 index페이지에서 프로필 정보 뿌려주는 컨드롤러
	@RequestMapping("Profile.do")
	public String index(HttpSession session, Model model) {

		String id = (String) session.getAttribute("userId");
		MemberDTO dto = service.readMember(id);
		
		if(!(dto.getUserProfile().contains("k.kakaocdn.net"))) {
			dto.setUserProfile(resource+dto.getUserProfile());
		}
		
		model.addAttribute("memDTO",dto);
		
		return "mypage/MypageIndex.tiles";
	}
	
	//회원 정보 조회 
	@RequestMapping(value = "/ProfileIndex.do", method = RequestMethod.GET)
	public void infoGET(HttpSession session, Model model) throws Exception{

		String id = (String) session.getAttribute("userId");
		MemberDTO dto = service.readMember(id);
		model.addAttribute("memDTO",dto);
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

			String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("upload/img");
			String fileName = file.getOriginalFilename();
			String realFileName = id+"/"+fileName;
			String imgUploadPath = uploadPath + File.separator + realFileName;
			
			//폴더 없을때 만들기
			String path = uploadPath+"/"+id;
			
			File Folder = new File(path);
		
			if (!Folder.exists()) {
				    Folder.mkdir();
			}
			else {}
			
			
			file.transferTo(new File(imgUploadPath));
			memberDTO.setUserProfile(realFileName);
		}
		
		memberDTO.setUserId(id);		
		MemberDTO memberDTO2 = service.updateMember(memberDTO);
		model.addAttribute("memDTO",memberDTO2);
		
		return "redirect:/mypage/Profile.do";
		
	}
	
}
