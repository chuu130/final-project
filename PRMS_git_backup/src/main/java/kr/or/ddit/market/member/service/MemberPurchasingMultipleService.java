package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MultiplePaymentInfoVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;

/**
 * 다건 결제를 진행하는 서비스
 * @author PC-08
 *
 */
public interface MemberPurchasingMultipleService {

	/**
	 * 장바구니 상품리스트를 조회하는 메소드
	 * @return
	 */
	public List<CartVO> retrieveCartList(String memNo);


	/**
	 * 다건 결제를 진행하는 메소드
	 * @return
	 * @throws PaymentException
	 */
	public void updatePaymentInfo(MultiplePaymentInfoVO paymentInfo);


	/**
	 * 결제완료된 정보를 조회하는 메소드
	 * @param orderDtlsId
	 * @return
	 */
	MemorderDefaultVO retrieveMemOrder(String orderDtlsId);
}
