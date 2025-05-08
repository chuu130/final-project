package kr.or.ddit.market.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.market.member.service.MemberPurchasingCommonService;
import kr.or.ddit.market.member.service.MemberPurchasingMultipleService;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.CommaUtils;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.MultiplePaymentInfoVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 다건 구매를 처리하는 컨트롤러
 * @author jbk
 *
 */
@Slf4j
@Controller
@RequestMapping("/market/member/multiplePurchasing")
public class MemberMultiplePurchasingController {

	@Autowired
	MemberPurchasingCommonService memberPurchasingCommonService; // 구매 공통처리를 담담하는 서비스

	@Autowired
	MemberPurchasingMultipleService memberPurchasingMultipleService; // 다건구매 서비스


	/**
	 * 다건 구매화면으로 이동하는 메소드
	 * @param redirectAttributes
	 * @param model
	 * @return
	 */
	@GetMapping
	public String memberMultiplePurchasingUI(
			RedirectAttributes redirectAttributes
			, Model model
	) {
		log.info("체킁");

		String lvn = "";
		// 1. 회원의 장바구니의 상품리스트를 가져온다. (장바구니, 상품정보)
		// 1.1. 시큐리티에 저장된 회원정보를 가져온다.
		SecurityContext sc = SecurityContextHolder.getContext();
		MemberVOWrapper memberVOWrapper = (MemberVOWrapper)(sc.getAuthentication().getPrincipal());

		log.info("회원정보 : {}",memberVOWrapper);

		String memNo = memberVOWrapper.getRealUser().getMemNo();

		// 1.2. 회원의 장바구니 상품리스트를 가져온다.
		List<CartVO> cartList = memberPurchasingMultipleService.retrieveCartList(memNo);

		// 2. 각 상품별로 본사의 재고정보와 비교한다.
		StringBuffer msgBuffer = new StringBuffer();
		for (CartVO cart : cartList) {
			int admininvQy = cart.getAdminInv().getAdmininvQy();
			Integer cdQy = cart.getCdQy();

			if(cdQy > admininvQy) {
				String prodSleNm = cart.getProd().getProdSleNm();
				msgBuffer.append(String.format("%s 상품이 구매가능 수량을 초과했습니다\n", prodSleNm));
			}
		}

		// 2.1. 구매가능 수량을 초과한 상품이 있다면
		// 2.2. 장바구니 페이지로 이동한 후, 해당 상품에 대한 재고초과 메시지를 출력한다.
		log.info("{}",msgBuffer.length());
		if(msgBuffer.length() > 0) {
			String msg = msgBuffer.toString();
			redirectAttributes.addAttribute("msg",msg);
			lvn = "redirect:/market/member/memberCart";
			return lvn;
		}

		// 구매수량이 정상일 경우
		// 회원 기본배송지를 가져온다.
		MemberaddressDefaultVO memberDefaultAddress = memberPurchasingCommonService.retrieveMemberAddress(memNo);
		// 회원 쿠폰정보를 가져온다.
		List<MycouponDefaultVO> myCouponList = memberPurchasingCommonService.retrieveMemberCouponList(memNo);

		// 주문금액을 구한다.
		int total = 0;
		for (CartVO cart : cartList) {
			total += cart.getProd().getProdSlePc() * cart.getCdQy();
		}

		// 적립금을 구한다.
		int payMl = total / 100;


		// 신규 주문번호를 생성한다.
		String newOrderId = memberPurchasingCommonService.retrieveNewOrderId();

		// 장바구니상품리스트, 배송지, 쿠폰정보, 적립금, 주문번호를 스코프에 저장한다.
		model.addAttribute("cartList", cartList);
		model.addAttribute("memberDefaultAddress", memberDefaultAddress);
		model.addAttribute("myCouponList" , myCouponList);
		model.addAttribute("payMl", CommaUtils.formatIntComma(payMl));
		model.addAttribute("newOrderId", newOrderId);
		model.addAttribute("total", CommaUtils.formatIntComma(total));


		// 다건 구매페이지로 이동한다.
		lvn = "market:/market/marketMultiplePurchasing";
		return lvn;
	}


	/**
	 * 클라이언트 결제데이터를 받은후, DB에 다건결제를 업데이트한 결과를 받아서 클라이언트에게 전송하는 메소드
	 */
	@PostMapping(value = "pay", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public void memberMultiplePurchasingProcess (
			@RequestBody MultiplePaymentInfoVO multiplePaymentInfo
			, Model model
	) {
		log.info("체킁 : {}", multiplePaymentInfo);
		boolean success;

		try {
			memberPurchasingMultipleService.updatePaymentInfo(multiplePaymentInfo);
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
		MemorderDefaultVO memOrder = memberPurchasingMultipleService.retrieveMemOrder(mechantUid);
		model.addAttribute("memOrder", memOrder);

		return "market:/market/marketMultiplePurchasingSuccess";
	}

}
