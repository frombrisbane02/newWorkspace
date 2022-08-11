package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pictory.springapp.Constants;
import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.MyCartDTO;
import com.pictory.springapp.dto.MyPageCartService;
import com.pictory.springapp.dto.PaymentService;

@Controller
@RequestMapping("/mypage/")
public class MypageCartController {
	@Autowired
	private MyPageCartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PaymentService paymentService;
	
	String resource = Constants.RESOURCE.toString();
	
	@RequestMapping("Cart.do")
	public String cart(HttpSession session, Model model) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		List<MyCartDTO> list = cartService.selectMyCartDTO(id);
		for(MyCartDTO lists : list) {
			lists.setPhotoUrl(resource+lists.getPhotoUrl());
		}
		model.addAttribute("myCartList", list);
		model.addAttribute("total", list.stream().mapToInt(cart -> cart.getTotalPrice()).sum());
		
		return "mypage/MypageCart.tiles";
	}
	
	@RequestMapping(value = "CartDelete.do", method = {RequestMethod.GET}) 
	public String cartDelete(HttpSession session) {
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		cartService.deleteMyCart(member.getUserNo());
		
		return "mypage/MypageCart.tiles";
	}
	
	@CrossOrigin
	@ResponseBody
	@RequestMapping(value = "CartPayment.do", method = {RequestMethod.POST}) 
	public String cartPayment(HttpSession session, @RequestParam(value="pdNo") List<Integer> productList, @RequestParam(value="total") int total ) {
		
		System.out.println("카트페이먼트.DO");
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		
		
		this.paymentService.payment(member.getUserNo(), productList, total);
		
		return "{\"cart\":\"sucsses\"}";
	}
	
	@RequestMapping(value = "Payment.do", method = {RequestMethod.POST}) 
	public void paymentWebHook(HttpSession session) {
		

	}

}
