package kr.or.ddit.market.member.service;

import java.util.List;

import kr.or.ddit.vo.RefundVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;

/**
 * 마켓 구매 공통코드를 담당하는 서비스
 * @author jbk
 *
 */
public interface MemberPurchasingCommonService {

	/**
	 * 기본배송지 정보를 조회하는 메소드
	 * @param memNo
	 * @return
	 */
	public MemberaddressDefaultVO retrieveMemberAddress(String memNo);


	/**
	 * 마켓 회원의 모든 배송지 정보를 조회하는 메소드
	 * @param memNo
	 * @return
	 */
	public List<MemberaddressDefaultVO> retrieveMemberAddressList(String memNo);


	/**
	 * 마켓 회원의 모든 쿠폰정보를 조회하는 메소드
	 * @param memNo
	 * @return
	 */
	public List<MycouponDefaultVO> retrieveMemberCouponList(String memNo);


	/**
	 * 신규 주문번호를 조회하는 메소드
	 * @return
	 */
	public String retrieveNewOrderId();


	/**
	 * 환불을 진행하는 메소드
	 * @param refund
	 */
	public void refundOrder(RefundVO refund);


	/**
	 * 본사매출에 반영되지 않은 결제된 주문정보를 조회한 후, 반영하는 메소드
	 */
	public void insertMarketOrderAmountToSelling();
	
	
	/**
	 * 본사지출에 반영되지 않은 환불된 주문정보를 조회한 후, 반영하는 메소드
	 */
	public void insertMarketOrderRefundToAdminExp();
	
}
