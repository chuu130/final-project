package kr.or.ddit.market.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.market.member.service.MemberCartService;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.CartDefaultVO;

@Controller
@RequestMapping("market/member")
public class MemberCartController {

	@Autowired
	private MemberCartService service;
	
	@GetMapping("/memberCart")
	public String memberCart(Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
		
		String memNo = member.getRealUser().getMemNo();
		
		List<CartVO> cartList = service.selectCartList(memNo);
		int cnt = service.selectCartCount(memNo);
		
		model.addAttribute("cartList", cartList);
		
		model.addAttribute("cartCount", cnt);
		
		return "market:market/memberCart";
	}

	
	@PostMapping("/memberCartUpdate")
	@ResponseBody
	public String memberCartUpdate(@RequestParam(value = "qty", required = false) int qty,
			@RequestParam(value="memNo" ,required = false) String memNo,
			@RequestParam(value = "prodId", required = false) String prodId) {
		
		int cnt = service.updateMemberCart(qty, memNo, prodId);
		
		if(cnt >0) {
			return "true";
		}
		
		return "false";
	}
	
	
	@PostMapping("/memberCartDelete")
	@ResponseBody
	public String memberCartDelete(@RequestParam(value="memNo" ,required = false) String memNo,
			@RequestParam(value = "prodId", required = false) String prodId) {
		
		int cnt = service.deleteMemberCart(memNo, prodId);
		
		if(cnt >0) {
			return "true";
			
		}
		
		return "false";
		
	}
}
