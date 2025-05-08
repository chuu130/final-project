package kr.or.ddit.market.member.service;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.PaymentInfoVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;

/**
 * 단건 결제를 처리하는 서비스
 * @author
 *
 */
public interface MemberPurchasingSingleService {

	/**
	 * 단건 결제를 진행하는 메소드
	 * @return
	 * @throws PaymentException
	 */
	public void updatePaymentInfo(PaymentInfoVO paymentInfo);


	/**
	 * 결제완료된 정보를 조회하는 메소드
	 * @param orderDtlsId
	 * @return
	 */
	public MemorderDefaultVO retrieveMemOrder(String orderDtlsId);
}
