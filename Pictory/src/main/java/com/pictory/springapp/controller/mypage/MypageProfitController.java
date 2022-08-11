package com.pictory.springapp.controller.mypage;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pictory.springapp.dto.AdjustmentDTO;
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
				.mapToInt(sale -> sale.getProfit())
				.sum();
		
		List<AdjustmentDTO> adjustment = paymentService.selectAdjustment(member.getUserNo()); 
		int adjTotal = adjustment.stream()
				.mapToInt(adj -> adj.getAdjAmount())
				.sum();
		
		model.addAttribute("sales", sales);
		model.addAttribute("preparedTotal", preparedTotal-adjTotal);
		model.addAttribute("adjustmentList", adjustment);
		return "mypage/MypageProfit.tiles";
	}
	
	@RequestMapping(value = "InsertProfit.do", method = RequestMethod.POST)
	public String insertProfit(HttpSession session, Model model, @RequestParam(value="adjAmount") Integer adjAmount, @RequestParam(value="bank") String bank) throws Exception {
		String id = (String) session.getAttribute("userId");
		System.out.println("InsertProfile들어왔다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		MemberDTO member = memberService.readMember(id);
		List<SalesDTO> sales = paymentService.selectMySales(member.getUserNo());
		int preparedTotal = sales.stream()
				.mapToInt(sale -> sale.getProfit())
				.sum();
		List<AdjustmentDTO> adjustment = paymentService.selectAdjustment(member.getUserNo());
		int adjTotal = adjustment.stream()
				.mapToInt(adj -> adj.getAdjAmount())
				.sum();
		
		if(preparedTotal - adjTotal < 0) throw new Exception("정산 가능 금액이 없습니다");
		
		AdjustmentDTO dto = new AdjustmentDTO(-1, adjAmount, bank, new Date(System.currentTimeMillis()), member.getUserNo());
		paymentService.insertAdjustment(dto);
		adjustment.add(dto);
		
		adjTotal = adjustment.stream()
				.mapToInt(adj -> adj.getAdjAmount())
				.sum();
		
		model.addAttribute("sales", sales);
		model.addAttribute("preparedTotal", preparedTotal-adjTotal);
		model.addAttribute("adjustmentList", adjustment);
		return "redirect:/mypage/Profit.do";
		
	}

}
