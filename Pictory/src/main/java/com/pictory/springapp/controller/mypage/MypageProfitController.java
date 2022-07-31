package com.pictory.springapp.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pictory.springapp.dto.MemberDTO;
import com.pictory.springapp.dto.MemberService;
import com.pictory.springapp.dto.PaymentService;
import com.pictory.springapp.dto.SalesDTO;

@Controller
@RequestMapping("/mypage/")
public class MypageProfitController {

	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("Profit.do")
	public String profit(HttpSession session, Model model) {
		System.out.println("마이페이지 장바구니 컨트롤러");
		
		String id = (String) session.getAttribute("userId");
		MemberDTO member = memberService.readMember(id);
		
		List<SalesDTO> sales = paymentService.selectMySales(member.getUserNo());
		int preparedTotal = sales.stream()
				.filter(sale -> sale.getStatus() == 0)
				.mapToInt(sale -> sale.getProfit())
				.sum();
		model.addAttribute("sales", sales);
		model.addAttribute("preparedTotal", preparedTotal);
		return "mypage/MypageProfit.tiles";
	}

}
