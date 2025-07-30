package kr.or.ddit.api.pay.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.api.pay.service.PaymentService;
import kr.or.ddit.vo.RefundVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/payment")
public class PaymentController {

	private final PaymentService paymentService;

	@GetMapping("/paymentUI")
	public String paymentUI() {
		return "master:/payment/paymentUI";
	}

	@PostMapping("cancel")
	public String paymentCancel(
		RefundVO refundVO
		,RedirectAttributes redirectAttributes
	) {
		// 환불처리
		try {
			paymentService.refund(refundVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		redirectAttributes.addFlashAttribute("msg","환불성공!");
		return "redirect:/payment/paymentUI";
	}


}
