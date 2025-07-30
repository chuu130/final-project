package kr.or.ddit.market.member.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.api.pay.service.PaymentService;
import kr.or.ddit.market.member.service.MemberPurchasingCommonService;
import kr.or.ddit.vo.RefundVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.Console;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

/**
 * 구매처리중 공통부분을 처리하는 컨트롤러
 * @author jbk
 *
 */
@Slf4j
@Controller
@RequestMapping("/market/member/commonPurchasing")
public class MemberCommonPurchasingController {

	@Autowired
	private MemberPurchasingCommonService memberPurchasingCommonService;


	/**
	 * 회원의 모든 배송지정보를 조회하는 메소드
	 * @param member
	 * @param model
	 */
	@PostMapping(value = "addressList", produces = MediaType.APPLICATION_JSON_VALUE)
	public void memberAddressListProcess(
			 @RequestBody MemberDefaultVO member
			, Model model
	) {
		List<MemberaddressDefaultVO> addressList = memberPurchasingCommonService.retrieveMemberAddressList(member.getMemNo());
		model.addAttribute("addressList", addressList);
	}


	/**
	 * 주문내역 페이지에서 환불을 처리하는 컨트롤러
	 */
	@PostMapping(value = "refund", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public void refundProcess(
			@RequestBody RefundVO refundData
			,Model model
	) {
		// 환불 값 체크
		log.info("환불데이터 : {}", refundData);

		boolean success;

		try {
			memberPurchasingCommonService.refundOrder(refundData);
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}

		model.addAttribute("success",success);
	}
}
