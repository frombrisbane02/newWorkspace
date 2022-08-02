package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MyCartDTO;
import com.pictory.springapp.dto.MyPageCartService;
import com.pictory.springapp.dto.PaymentService;
import com.pictory.springapp.service.impl.MemberServiceImpl;

@Controller
@RequestMapping("/mypage/")
public class MypageCartController {
	@Autowired
	private MyPageCartService cartService;
	
	@Autowired
	private MemberServiceImpl memberService;
	
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping("Cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		List<MyCartDTO> list = cartService.selectMyCartDTO(id);
		model.addAttribute("myCartList", list);
		model.addAttribute("total", list.stream().mapToInt(cart -> cart.getTotalPrice()).sum());
		
		return "mypage/MypageCart.tiles";
	}
	
	@RequestMapping(value = "CartDelete.do", method = {RequestMethod.GET}) 
	public String cartDelete(HttpSession session) {
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		cartService.deleteMyCart(member.getUserNo());
		
		return "mypage/MypageIndex.tiles";
	}
	
	@RequestMapping(value = "CartPayment.do", method = {RequestMethod.POST}) 
	public String cartPayment(HttpSession session, @RequestParam(value="pdNo") List<Integer> productList, @RequestParam(value="total") int total ) {
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		
		
		this.paymentService.payment(member.getUserNo(), productList, total);
		
		return "mypage/MypageCart.tiles"; 
	}

}
