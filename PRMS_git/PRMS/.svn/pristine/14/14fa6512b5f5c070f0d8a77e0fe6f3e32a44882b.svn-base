package kr.or.ddit.market.member.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.market.common.service.ProdDetailService;
import kr.or.ddit.market.member.service.MemberPurchasingCommonService;
import kr.or.ddit.market.member.service.MemberPurchasingSingleService;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.PaymentInfoVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 단건 구매를 처리하는 컨트롤러
 * @author jbk
 */
@Slf4j
@Controller
@RequestMapping("/market/member/singlePurchasing")
public class MemberSinglePurchasingController {

	@Autowired
	ProdDetailService prodDetailService; // 본사 상품정보와 재고정보를 가져오기 위한 서비스 객체

	@Autowired
	MemberPurchasingCommonService memberPurchasingCommonService; // 구매 공통처리를 담담하는 서비스

	@Autowired
	MemberPurchasingSingleService memberPurchasingSingleService;

	/**
	 * 단건 구매화면으로 이동하는 메소드
	 * @param prodId
	 * @param cdQy
	 * @return
	 */
	@GetMapping("{prodId}/{cdQy}")
	public String memberSinglePurchasingUI(
			@PathVariable String prodId
			, @PathVariable int cdQy
			, RedirectAttributes redirectAttributes
			, Model model
	) {
		log.info("상품아이디 : {}\n 구매수량 : {}",prodId, cdQy);
		String lvn = "";

		// 본사의 재고정보를 가져온다. (상품포함)
		AdmininvDefaultVO prodDetail = prodDetailService.retrieveProd(prodId);

		// 구매수량이 본사재고정보를 초과했을 경우
		int admininvQy = prodDetail.getAdmininvQy();
		if(cdQy > admininvQy) {
			// 이전페이지로 이동한 후, 재고초과 메시지를 출력한다.
			redirectAttributes.addFlashAttribute("msg", "구매가능한 수량을 초과했습니다.");
			lvn = String.format("redirect:/market/prodDetail/%s", prodId);
		} else {
			// 구매수량이 정상일 경우
			// 회원 기본배송지를 가져온다.
			SecurityContext sc = SecurityContextHolder.getContext();
			MemberVOWrapper memberVOWrapper   =(MemberVOWrapper)(sc.getAuthentication().getPrincipal());

			log.info("회원정보 : {}",memberVOWrapper);

			String memNo = memberVOWrapper.getRealUser().getMemNo();
			MemberaddressDefaultVO memberDefaultAddress = memberPurchasingCommonService.retrieveMemberAddress(memNo);

			// 회원 쿠폰정보를 가져온다.
			List<MycouponDefaultVO> myCouponList = memberPurchasingCommonService.retrieveMemberCouponList(memNo);

			// 적립금을 구한다.
			int prodSlePc = prodDetail.getProd().getProdSlePc() / 100;

			// 신규 주문번호를 생성한다.
			String newOrderId = memberPurchasingCommonService.retrieveNewOrderId();

			// 상품, 구매수량, 배송지, 쿠폰정보, 적립금, 주문번호를 스코프에 저장한다.
			model.addAttribute("prodDetail",prodDetail);
			model.addAttribute("cdQy",cdQy);
			model.addAttribute("memberDefaultAddress", memberDefaultAddress);
			model.addAttribute("myCouponList" , myCouponList);
			model.addAttribute("prodSlePc",prodSlePc);
			model.addAttribute("newOrderId",newOrderId);

			lvn = "market:/market/marketSinglePurchasing";
		}

		return lvn;
	}


	/**
	 * 클라이언트 결제데이터를 받은후, DB에 단건결제를 업데이트한 결과를 받아서 클라이언트에게 전송하는 메소드
	 */
	@PostMapping(value = "pay",consumes = MediaType.APPLICATION_JSON_VALUE ,produces = MediaType.APPLICATION_JSON_VALUE)
	public void memberSinglePurchasingProcess(
			@RequestBody PaymentInfoVO paymentInfo
			, Model model
	) {
		log.info("체킁 : {}", paymentInfo);

		boolean success;

		try {
			memberPurchasingSingleService.updatePaymentInfo(paymentInfo);
			success = true;
		} catch (PaymentException e) {
			success = false;
		}

		model.addAttribute("success",success);
	}


	@GetMapping(value = "success/{mechantUid}")
	public String memberSinglePurchasingSuccess(
			@PathVariable String mechantUid
			, Model model
	) {
		MemorderDefaultVO memOrder = memberPurchasingSingleService.retrieveMemOrder(mechantUid);
		model.addAttribute("memOrder", memOrder);

		return "market:/market/marketSinglePurchasingSuccess";
	}

}
