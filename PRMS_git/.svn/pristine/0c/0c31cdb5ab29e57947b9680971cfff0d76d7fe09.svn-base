package kr.or.ddit.market.member.service;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.market.member.mapper.MemberPurchasingCommonMapper;
import kr.or.ddit.vo.RefundVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/*-context.xml")
@Transactional
class MemberPurchasingCommonServiceImplTest {

	@Autowired
	MemberPurchasingCommonService memberPurchasingCommonService;

	@Autowired
	MemberPurchasingCommonMapper memberPurchasingCommonMapper;

	RefundVO refund;

	@BeforeEach
	void beforeEach() {
		refund = new RefundVO();
		refund.setMerchant_uid("MO000000000000000178");
		refund.setCancel_request_amount(355000);
	}


	@Test
	void testRefundOrder () {
		memberPurchasingCommonService.refundOrder(refund);
	}

}
