package kr.or.ddit.market.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.headquarter.master.service.PartProdService;
import kr.or.ddit.market.common.service.MycouponService;
import kr.or.ddit.market.member.service.MemberAddressService;
import kr.or.ddit.market.member.service.MemberPurchasingMultipleService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.market.member.service.RankService;
import kr.or.ddit.market.member.service.ReviewService;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;
import kr.or.ddit.vo.def.RankDefaultVO;
import kr.or.ddit.vo.def.ReviewDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@EnableScheduling
@RequestMapping("/market/member")
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MemberAddressService Addrservice;
	@Autowired
	private RankService Rankservice;
	@Autowired
	private MycouponService Mycouservice;
	@Autowired
	private PartProdService Prodservice;
	@Autowired
	private MemberPurchasingMultipleService memberPurchasingMultipleService;
	@Autowired
	private MycouponService couponservice;
	@Autowired
	private ReviewService reviewservice;



	@Scheduled(cron = "0 0 0 1 * *")
	public void runPerCronSetting() {
		List<MemberDefaultVO> allMember = service.selectMemberList();
		for (MemberDefaultVO memVo : allMember) {
			for (RankDefaultVO rankvo : memVo.getRanklist()) {
				if (rankvo.getRankSe().equals("2")) {
					MycouponDefaultVO couponVo = new MycouponDefaultVO();
					couponVo.setMemNo(memVo.getMemNo());
					couponVo.setCouponNo("CP000012");
					couponVo.setCouponDelyn("N");
					couponservice.insertMycoupon(couponVo);
				}
				else if (rankvo.getRankSe().equals("3")) {
					MycouponDefaultVO couponVo = new MycouponDefaultVO();
					couponVo.setMemNo(memVo.getMemNo());
					couponVo.setCouponNo("CP000011");
					couponVo.setCouponDelyn("N");
					couponservice.insertMycoupon(couponVo);
				}
				else if (rankvo.getRankSe().equals("4")) {
					MycouponDefaultVO couponVo = new MycouponDefaultVO();
					couponVo.setMemNo(memVo.getMemNo());
					couponVo.setCouponNo("CP000009");
					couponVo.setCouponDelyn("N");
					couponservice.insertMycoupon(couponVo);
				}
			}
		}
	}

	@GetMapping("/{memId}/mypage")
	public String mypage(@PathVariable("memId") String memId, Model model) {
		MemberDefaultVO memVO = service.selectMemberId(memId);

		if (memVO == null) {
			log.error("Member not found for memId: {}", memId);
			return "redirect:/errorPage"; // 에러 페이지로 리디렉션하거나 적절한 오류 처리를 합니다.
		}

		MemberaddressDefaultVO addrVO = Addrservice.selectAddressMemNo(memVO.getMemNo());

		if (addrVO == null) {
			log.warn("Address not found for memNo: {}", memVO.getMemNo());
			// addrVO를 null로 설정하고 처리할 수 있습니다.
		}

		List<MemberDefaultVO> list = service.payment(memVO.getMemNo());
		int total = 0;

		if (list != null) {
			for (MemberDefaultVO memberVO : list) {
				if (memberVO.getMemorderlist() != null) {
					for (MemorderDefaultVO orderVO : memberVO.getMemorderlist()) {
						if (orderVO.getPaylist() != null) {
							for (PaymentDefaultVO payvo : orderVO.getPaylist()) {
								total += total + payvo.getPayAmount();
							}
						}
					}
				}
			}
		}
		if (total >= 300000 && total < 500000) {

			Rankservice.updateRankgold(memVO.getMemNo());
		} else if (total >= 500000 && total < 800000) {
			Rankservice.updateRankplatinum(memVO.getMemNo());
		} else if (total >= 800000) {
			Rankservice.updateRankdiamond(memVO.getMemNo());
		}

		String rankSE = Rankservice.selectRankSE(memVO.getMemNo());
		if (rankSE.equals("1")) {
			rankSE = "실버";
		} else if (rankSE.equals("2")) {
			rankSE = "골드";
		} else if (rankSE.equals("3")) {
			rankSE = "플래티넘";
		} else {
			rankSE = "다이아몬드";
		}

		RankDefaultVO rankVO = new RankDefaultVO();
		rankVO.setRankSe(rankSE);
		System.out.println("====================================================" + rankVO.getRankSe());

		model.addAttribute("memberVO", memVO);
		model.addAttribute("rankVO", rankVO);
		model.addAttribute("addrVO", addrVO);

		return "market:member/memberMypage";

	}

	@GetMapping("{memNo}/memcoupon")
	public String memCoupon(@PathVariable String memNo, Model model) {
		List<MycouponDefaultVO> couList = Mycouservice.selectMycouponMemNo(memNo);
		MemberDefaultVO memVO = service.selectMember(memNo);
		System.out.println("===================================" + memVO.toString());
		for (MycouponDefaultVO couVO : couList) {
			String delyn = couVO.getCouponDelyn();
			if (delyn.equals("Y")) {
				delyn = "사용";
			} else {
				delyn = "미사용";
			}
			couVO.setCouponDelyn(delyn);
		}
		model.addAttribute("conponList", couList);
		model.addAttribute("memVO", memVO);

		return "market:member/memCouponList";
	}



	/**
	 * 회원의 주문내역을 조회하여 전달하는 메소드
	 * @author jbk
	 * @param model
	 * @return
	 */
	@GetMapping("orderList")
	public String memorderList(
			Model model
	) {
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper memberVOWrapper = (MemberVOWrapper) (sc.getAuthentication().getPrincipal());

		log.info("회원정보 : {}", memberVOWrapper);

		String memNo = memberVOWrapper.getRealUser().getMemNo();

		// 주문내역을 조회한다.
		List<MemorderDefaultVO> memOrderList = service.retrieveMemOrderList(memNo);

		MemberDefaultVO memVO = memberVOWrapper.getRealUser();

		model.addAttribute("memOrderList", memOrderList);
		model.addAttribute("memberVO", memVO);

		return "market:member/memOrderList";
	}


	/**
	 * 회원의 리뷰내역을 가져가는 메소드
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping("reviewOrder")
	public 	List<ReviewDefaultVO> reviewList(Authentication authentication
	) {
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper memberVOWrapper = (MemberVOWrapper)(sc.getAuthentication().getPrincipal());
		String memNo = memberVOWrapper.getRealUser().getMemNo();
		// 리뷰내역을 조회
		List<ReviewDefaultVO> memReview = reviewservice.selectMemReviewList(memNo);

		return memReview;
	}



	/**
	 * 입력받은 배송정보에 해당하는 주문정보를 조회하여 전달하는 메소드
	 * @author jbk
	 * @param searchOrder
	 * @param model
	 */
	@GetMapping("orderList/{dlvySttus}")
	public String memOrderSearchList(
			@PathVariable String dlvySttus
			, Model model
	) {
		log.info("배송상태 : {}", dlvySttus);

		List<MemorderDefaultVO> memOrderList = service.retrieveMemOrderDlvySttusList(dlvySttus);
		model.addAttribute("memOrderList", memOrderList);
		model.addAttribute("chDlvySttus",dlvySttus);


		return "market:member/memOrderList";
	}


	/**
	 * 상세 주문내역을 조회하는 메소드
	 * @author jbk
	 * @param orderNumber
	 * @param model
	 */
	@PostMapping("orderDt")
	public void memrOrderDt(@RequestBody Map<String, String> orderNumber, Model model) {
		log.info("주문번호 : {}", orderNumber);
		MemorderDefaultVO memOrderDt = memberPurchasingMultipleService.retrieveMemOrder(orderNumber.get("orderNumber"));
		model.addAttribute("memOrderDt", memOrderDt);
	}

	@PostMapping("/memUpdate")
	public String memUpdate(MemberDefaultVO memVO, @RequestParam String memZip, @RequestParam String memAdres1,
			@RequestParam String memAdres2) {
		service.updateMember(memVO);
		MemberaddressDefaultVO addrVO = Addrservice.selectAddressMemNo(memVO.getMemNo());
		addrVO.setMemZip(memZip);
		addrVO.setMemAdres1(memAdres1);
		addrVO.setMemAdres2(memAdres2);
		Addrservice.updateAddress(addrVO);

		return "redirect:/market/member/"+memVO.getMemId()+"/mypage";
	}

	@PostMapping("/memberDelete")
	public String memDel(String memNo, String memPassword, HttpSession session) {
		int cnt = service.deleteMember(memNo);
		if(cnt > 0) {
			// 회원 탈퇴 성공 후 세션 만료
			session.invalidate();

		}
		else {
			// 비밀번호가 맞지 않음
			MemberDefaultVO memVO = service.selectMember(memNo);
			// 마이페이지로 다시 이동
			return "redirect:/market/member/"+memVO.getMemId()+"/mypage";
		}

		// 마켓 메인 페이지 이동
		return "redirect:/market/marketpage.do";
	}

}
