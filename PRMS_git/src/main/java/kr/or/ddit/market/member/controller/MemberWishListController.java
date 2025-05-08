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
import kr.or.ddit.market.member.service.MemberWishListService;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.MemberWishListVO;

@Controller
@RequestMapping("market/member")
public class MemberWishListController {
	
	@Autowired
	private MemberWishListService service;

	@GetMapping("/memberWishList")
	public String memberWishList(Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
		
		String memNo = member.getRealUser().getMemNo();
		
		List<MemberWishListVO> wishList = service.selectMemberWishList(memNo);
		int cnt = service.selectWishListCount(memNo);
		
		model.addAttribute("wishList", wishList);
		
		model.addAttribute("cartCount", cnt);
		
		return "market:market/memberWishList";
	}
	
	@PostMapping("/memberWishListDelete")
	@ResponseBody
	public int memberWishListDelete(@RequestParam(value="memNo" ,required = false) String memNo,
			@RequestParam(value = "prodId", required = false) String prodId) {
		
		int cnt = service.deleteMemberWishListProd(memNo, prodId);
		
		int cnt1 = service.selectWishListCount(memNo);
		
		return cnt1;
	}
	
	@PostMapping("/addWishList")
	@ResponseBody
	public int memberAddWishList(@RequestParam(value="memNo" ,required = false) String memNo,
			@RequestParam(value = "prodId", required = false) String prodId
			, Model model) {
		
		service.insertWishList(memNo, prodId);
		
		int cnt = service.selectWishListCount(memNo);
		
		return cnt;
	}
	
	@PostMapping("/wishListUpdate")
	@ResponseBody
	public List<MemberWishListVO> wishListUpdate(@RequestParam(value="memNo" ,required = false) String memNo
			, Model model) {
		
		List<MemberWishListVO> wishList = service.selectMemberWishList(memNo);
		
		
		return wishList;
	}
}
