package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pictory.springapp.dto.MyCartDTO;
import com.pictory.springapp.dto.MyPageCartService;

@Controller
@RequestMapping("/mypage/")
public class MypageCartController {
	@Autowired
	private MyPageCartService cartService;
	
	@RequestMapping("Cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		List<MyCartDTO> list = cartService.selectMyCartDTO(id);
		model.addAttribute("myCartList", list);
		
		return "mypage/MypageCart.tiles";
	}

}
