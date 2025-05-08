package kr.or.ddit.market.member.service;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.apache.poi.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.api.pay.service.PaymentService;
import kr.or.ddit.market.member.mapper.MemberMultiplePurchasingMapper;
import kr.or.ddit.market.member.mapper.MemberPurchasingCommonMapper;
import kr.or.ddit.vo.MultiplePaymentInfoVO;
import kr.or.ddit.vo.RefundVO;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberPurchasingCommonServiceImpl implements MemberPurchasingCommonService {

	@Autowired
	MemberPurchasingCommonMapper memberPurchasingCommonMapper;

	@Autowired
	PaymentService paymentService;

	@Autowired
	MemberMultiplePurchasingMapper membeMultiplePurchasingMapper;

	@Autowired
	AuthenticationProvider provider;

	@Override
	public MemberaddressDefaultVO retrieveMemberAddress(String memNo) {
		return memberPurchasingCommonMapper.selectMemberAddress(memNo);
	}

	@Override
	public List<MemberaddressDefaultVO> retrieveMemberAddressList(String memNo) {
		return memberPurchasingCommonMapper.selectMemberAddressList(memNo);
	}

	@Override
	public List<MycouponDefaultVO> retrieveMemberCouponList(String memNo) {
		return memberPurchasingCommonMapper.selectMemberCouponList(memNo);
	}

	@Override
	public String retrieveNewOrderId() {
		return memberPurchasingCommonMapper.selectNewOrderId();
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void refundOrder(RefundVO refund) {

		// 환불을 진행한다. (결제 API쪽 처리)
		paymentService.refund(refund);

		// 주문정보(주문, 주문상세, 결제, 배송)를 가져온다.
		MemorderDefaultVO memOrder = membeMultiplePurchasingMapper.selectMemOrder(refund.getMerchant_uid());

		// 회원의 마일리지를 정보를 복구한다.
		recoveryMlStatus(memOrder);

		// 사용한 쿠폰을 복구한다.
		recoveryCouponStatus(memOrder);

		// 배송상태를 업데이트 한다.
		updateDelvStatus(memOrder);

		// 본사의 재고수량을 업데이트 한다.
		updateAdimininvQy(memOrder);

		// 주문정보를 환불로 변경한다. (이후 스케쥴링으로 일괄처리함)
		memberPurchasingCommonMapper.updateMarketOrderIncomeRefund(refund.getMerchant_uid());

		// 트랜잭션 성공시, 스프링 시큐리티에 저장된 회원정보를 수정한다. (마일리지 정보가 업데이트 됨)
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		Object details = authentication.getDetails();

		SecurityContext newSecurityContext = SecurityContextHolder.createEmptyContext();
		UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(authentication.getName(), authentication.getCredentials());

		Authentication newAuthentication = provider.authenticate(token);
		((UsernamePasswordAuthenticationToken) newAuthentication).setDetails(details);
		newSecurityContext.setAuthentication(newAuthentication);
		SecurityContextHolder.setContext(newSecurityContext);
	}


	/**
	 * 마일리지 정보를 복구하는 메소드
	 * @param memOrder
	 */
	private void recoveryMlStatus(MemorderDefaultVO memOrder) {

		// 결제정보를 가져온다.
		PaymentDefaultVO paymentInfo = memOrder.getPayment();

		// 보유마일리지 적립정보와 회원정보를 가져온다.
		Integer payMileageDiscount = paymentInfo.getPayMileageDiscount();
		String memNo = memOrder.getMemNo();

		// 마일리지 할인정보가 있다면
		if(payMileageDiscount != null && payMileageDiscount != 0) {
			// 회원의 마일리지를 복구한다.
			MemberDefaultVO member = new MemberDefaultVO();
			member.setMemNo(memNo);

			member.setMemMl(payMileageDiscount);

			memberPurchasingCommonMapper.updateMemberMileage(member);
		}
	}


	/**
	 * 쿠폰상태를 복구하는 메소드
	 * @param memOrder
	 */
	private void recoveryCouponStatus(MemorderDefaultVO memOrder) {

		// 결제정보를 가져온다.
		PaymentDefaultVO paymentInfo = memOrder.getPayment();

		// 회원정보와 쿠폰아이디를 가져온다.
		String memNo = memOrder.getMemNo();
		String mycouponNo = paymentInfo.getMycouponNo();

		// 사용한 쿠폰정보가 있다면
		if(mycouponNo != null && StringUtil.isNotBlank(mycouponNo)) {
			// 회원 쿠폰정보에서 해당 쿠폰을 복구한다.
			MycouponDefaultVO beforeCoupon = new MycouponDefaultVO();
			beforeCoupon.setMemNo(memNo);
			beforeCoupon.setMycouponNo(mycouponNo);

			memberPurchasingCommonMapper.updateMyCouponBefore(beforeCoupon);
		}
	}


	/**
	 * 배송상태를 변경하는 메소드
	 * @param memOrder
	 */
	private void updateDelvStatus(MemorderDefaultVO memOrder) {

		// 배송정보를 가져온다.
		DeliveryDefaultVO delivery = memOrder.getDelivery();

		// 배송상태를 변경한다.
		memberPurchasingCommonMapper.updateDeliveryStatus(delivery);
	}


	/**
	 * 본사 수량을 복구하는 메소드
	 * @param memOrder
	 */
	private void updateAdimininvQy(MemorderDefaultVO memOrder) {

		// 주문상세 리스트를 가져온다.
		List<OrderdtDefaultVO> orderDtList = memOrder.getOrderDtList();

		// 주문상세 리스트만큼 반복한다.
		orderDtList.forEach((orderDt) -> {
			// 본사재고를 수정한다.
			memberPurchasingCommonMapper.updateOrderDtList(orderDt);
		});
	}


	/**
	 * 온라인 주문내역을 본사 매출에 반영하는 메소드 (매일 오전 12시에 처리함)
	 */
//	@Scheduled(cron = "0 0 0 1/1 * ? *")
	@Scheduled(fixedDelay = 1000 * 60 * 60 * 24)
	@Override
	public void insertMarketOrderAmountToSelling() {

		// 본사매출에 반영되지 않은 주문리스트를 조회한다.
		List<MemorderDefaultVO> noneInComeMemOrderList = memberPurchasingCommonMapper.selectNoneIncomeMemOrderList();

		// 본사매출에 반영되지 않은 상품리스트만큼 반복한다.
		for(MemorderDefaultVO noneIncomeMemOrder: noneInComeMemOrderList) {

			// 주문정보를 본사매출에 반영한다.
			memberPurchasingCommonMapper.insertMarketOrderAmountToSelling(noneIncomeMemOrder);

			// 주문정보 반영상태를 변경한다.(반영완료 : Y)
			memberPurchasingCommonMapper.updateMarketOrderIncomeSuccess(noneIncomeMemOrder.getOrderDtlsId());

			log.info("본사매출에 반영된 주문정보 : {}", noneIncomeMemOrder);
		}
	}


	/**
	 * 본사지출에 반영되지 않은 환불된 주문정보를 조회한 후, 반영하는 메소드 (매일 오전 12시에 처리함)
	 */
//	@Scheduled(cron = "0 0 0 1/1 * ? *")
	@Scheduled(fixedDelay = 1000 * 60 * 60 * 24)
	@Override
	public void insertMarketOrderRefundToAdminExp() {

		// 본사지출에 반영되지 않은 환불처리된 주문리스트를 조회한다.
		List<MemorderDefaultVO> refundIncomeMemOrderList = memberPurchasingCommonMapper.selectRefundIncomeMemOrderList();

		// 본사지출에 반영되지 않은 상품리스트만큼 반복한다.
		for(MemorderDefaultVO refundIncomeMemOrder : refundIncomeMemOrderList) {

			// 주문정보를 본사지출에 반영한다.
			memberPurchasingCommonMapper.insertMarketOrderRefundAmountToAdminExp(refundIncomeMemOrder);

			// 주문정보 반영상태를 변경한다.(반영완료 : Y)
			memberPurchasingCommonMapper.updateMarketOrderIncomeSuccess(refundIncomeMemOrder.getOrderDtlsId());

			log.info("본사지출에 반영된 주문정보 : {}", refundIncomeMemOrder);
		}
	}
}
