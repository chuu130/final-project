package kr.or.ddit.api.pay.service;

import kr.or.ddit.vo.RefundVO;

public interface PaymentService {

	public void refund(RefundVO refundData);

}
