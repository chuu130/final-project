package kr.or.ddit.api.pay.service;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.or.ddit.vo.RefundVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	IamportClient client;

	@Override
	public void refund(RefundVO refundData) {

		String merchant_udi=refundData.getMerchant_uid(); // 주문번호
		CancelData cancel_data = new CancelData(merchant_udi, false, BigDecimal.valueOf(refundData.getCancel_request_amount()));

		try {
			IamportResponse<Payment> payment_response = client.cancelPaymentByImpUid(cancel_data);
			log.info("{}",payment_response.getMessage());

		} catch (IamportResponseException e) {
			log.info("{} \n {}",e.getMessage(),e.getHttpStatusCode());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
