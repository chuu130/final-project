package kr.or.ddit.market.member.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.market.member.mapper.MemberCartMapper;
import kr.or.ddit.market.member.mapper.MemberMultiplePurchasingMapper;
import kr.or.ddit.market.member.mapper.MemberPurchasingCommonMapper;
import kr.or.ddit.vo.CartVO;
import kr.or.ddit.vo.MultiplePaymentInfoVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberPurchasingMultipleServiceImpl implements MemberPurchasingMultipleService {

	@Autowired
	MemberCartMapper memberCartMapper;

	@Autowired
	MemberPurchasingCommonMapper memberPurchasingCommonMapper;

	@Autowired
	MemberMultiplePurchasingMapper memberMultiplePurchasingMapper;

	@Autowired
	AuthenticationProvider provider;


	@Override
	public List<CartVO> retrieveCartList(String memNo) {
		return memberCartMapper.selectCartList(memNo);
	}


	@Override
	@Transactional(rollbackFor = {Exception.class})
	public void updatePaymentInfo(MultiplePaymentInfoVO paymentInfo) {

		// 주문정보와 주문상세정보를 추가한다.
		insertOrder(paymentInfo);

		// 결제정보를 추가한다.
		insertPayment(paymentInfo);

		// 쿠폰정보를 업데이트한다.
		updateCoupon(paymentInfo);

		// 회원의 마일리지 정보를 업데이트한다.
		updateMemMl(paymentInfo);

		// 배송지 정보를 업데이트한다.
		updateDelivery(paymentInfo);

		// 본사 재고수량을 업데이트한다.
		updateAdimininvQy(paymentInfo);

		// 장바구니 정보를 삭제한다.
		memberMultiplePurchasingMapper.deleteCart(paymentInfo.getMemNo());

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


	@Override
	public MemorderDefaultVO retrieveMemOrder(String orderDtlsId) {
		return memberMultiplePurchasingMapper.selectMemOrder(orderDtlsId);
	}


	/**
	 * 주문번호와 주문상세정보를 추가하는 메소드
	 * @param paymentInfo
	 */
	private void insertOrder(MultiplePaymentInfoVO paymentInfo) {
		// 1. 주문정보를 업데이트 한다. (주문번호)
		// 2. 주문상세정보를 업데이트 한다. (구매한 상품아이디, 구매수량, 주문금액)
		String merchantUid = paymentInfo.getMechantUid();
		String memNo = paymentInfo.getMemNo();
		List<String> prodIdList = paymentInfo.getProdIdList();
		List<Integer> cdQyList = paymentInfo.getCdQyList();
		Integer orderPrice = paymentInfo.getOrderPrice();

		MemorderDefaultVO newMemberOrder = new MemorderDefaultVO();

		List<OrderdtDefaultVO> orderDtList = new ArrayList<OrderdtDefaultVO>();

		for(int i = 0 ; i < prodIdList.size(); i++) {
			OrderdtDefaultVO order = new OrderdtDefaultVO();
			order.setProdId(prodIdList.get(i));
			order.setOrderProdQy(cdQyList.get(i));
			order.setOrderProdAmount(orderPrice);
			orderDtList.add(order);
		}

		newMemberOrder.setOrderDtlsId(merchantUid);
		newMemberOrder.setMemNo(memNo);
		newMemberOrder.setOrderDtList(orderDtList);

		memberPurchasingCommonMapper.insertOrder(newMemberOrder);
	}


	/**
	 * 결제정보를 추가하는 메소드
	 * @param paymentInfo
	 */
	private void insertPayment(MultiplePaymentInfoVO paymentInfo) {

		// 3. 결제정보를 업데이트한다. (선적립금 할인금액, 보유적립금 사용금액, 총적립금할인금액, 쿠폰할인금액, 총결제금액, PG사, 페이메소드, 결제회사)
		Integer preDiscountMoney = paymentInfo.getPreDiscountMoney();
		Integer memMlMoney = paymentInfo.getMemMlMoney();
		Integer totalMileageDiscountPrice = paymentInfo.getTotalMileageDiscountPrice();
		Integer couponDiscountPrice = paymentInfo.getCouponDiscountPrice();
		Integer paidAmount = paymentInfo.getPaidAmount();
		String pgProvider = paymentInfo.getPgProvider();
		String payMethod = paymentInfo.getPayMethod();
		String payCompany = paymentInfo.getPayCompany();
		String mechantUid = paymentInfo.getMechantUid();
		Integer addSavings = paymentInfo.getAddSavings();
		String couponId = paymentInfo.getCouponId();

		PaymentDefaultVO newPayment = new PaymentDefaultVO();
		newPayment.setPayMileageDiscount(memMlMoney);
		newPayment.setPayCouponDiscount(couponDiscountPrice);
		newPayment.setPayTotalDiscount(totalMileageDiscountPrice + couponDiscountPrice);
		newPayment.setPayMethod(payMethod);
		newPayment.setPayAmount(paidAmount);
		newPayment.setOrderDtlsId(mechantUid);
		newPayment.setPayPremileageDiscount(preDiscountMoney);
		newPayment.setPayMileageTotalDiscount(preDiscountMoney + memMlMoney);
		newPayment.setPayPg(pgProvider);
		newPayment.setPayCompany(payCompany);
		newPayment.setPayMlsavings(addSavings);
		newPayment.setMycouponNo(couponId);

		memberPurchasingCommonMapper.insertPayment(newPayment);
	}


	/**
	 * 쿠폰 사용정보를 업데이트 하는 메소드
	 * @param paymentInfo
	 */
	private void updateCoupon(MultiplePaymentInfoVO paymentInfo) {
		// 4. 마이쿠폰 정보를 업데이트한다.(마이쿠폰아이디, 쿠폰할인금액)
		// 4.1. 쿠폰할인금액이 없다면 업데이트하지 않는다.
		String couponId = paymentInfo.getCouponId();
		Integer couponDiscountPrice = paymentInfo.getCouponDiscountPrice();
		String memNo = paymentInfo.getMemNo();


		if(couponDiscountPrice != null && couponDiscountPrice != 0) {
			MycouponDefaultVO myCoupon = new MycouponDefaultVO();
			myCoupon.setMycouponNo(couponId);
			myCoupon.setMemNo(memNo);

			memberPurchasingCommonMapper.updateMyCoupon(myCoupon);
		}
	}


	/**
	 * 회원의 마일리지를 업데이트하는 메소드
	 * @param paymentInfo
	 */
	private void updateMemMl(MultiplePaymentInfoVO paymentInfo) {

		// 5. 선적립금 정보와 보유적립금 사용정보를 기반으로 회원의 마일리지를 업데이트 한다.(보유적립금 사용금액, 선적립금 할인금액, 구매적립 금액, 총적립금 할인금액)
		String memNo = paymentInfo.getMemNo();
		Integer memMlMoney = paymentInfo.getMemMlMoney();


		Integer addSavings = paymentInfo.getAddSavings(); // 구매적립금 (선적립 할인시 0원임)

		MemberDefaultVO member = new MemberDefaultVO();
		member.setMemNo(memNo);
		member.setMemMl(addSavings - memMlMoney);

		memberPurchasingCommonMapper.updateMemberMileage(member);
	}


	/**
	 * 배송지 정보를 업데이트하는 메소드
	 * @param paymentInfo
	 */
	private void updateDelivery(MultiplePaymentInfoVO paymentInfo) {

		// 6. 배송지 정보를 업데이트한다. (주문상세내역 아이디, 우편번호, 주소, 상세배송지)
		String address = paymentInfo.getAddress();
		String detailAddress = paymentInfo.getDetailAddress();
		String zip = paymentInfo.getZip();
		String mechantUid = paymentInfo.getMechantUid();


		DeliveryDefaultVO delivery = new DeliveryDefaultVO();
		delivery.setOrderDtlsId(mechantUid);
		delivery.setDlvyAdres1(address);
		delivery.setDlvyAdres2(detailAddress);
		delivery.setDlvyZip(zip);

		memberPurchasingCommonMapper.insertDelivery(delivery);
	}


	/**
	 * 본사 재고수량을 업데이트하는 메소드
	 * @param paymentInfo
	 */
	private void updateAdimininvQy(MultiplePaymentInfoVO paymentInfo) {

		// 7. 구매수량을 기반으로 본사 재고를 업데이트 한다. (구매수량, 구매한 상품아이디)
		List<Integer> cdQyList = paymentInfo.getCdQyList();
		List<String> prodIdList = paymentInfo.getProdIdList();

		for(int i = 0 ; i< prodIdList.size(); i++) {

			AdmininvDefaultVO admininv = new AdmininvDefaultVO();
			admininv.setAdmininvQy(cdQyList.get(i));
			admininv.setProdId(prodIdList.get(i));

			memberMultiplePurchasingMapper.updateAdmininvQy(admininv);
		}
	}

}
