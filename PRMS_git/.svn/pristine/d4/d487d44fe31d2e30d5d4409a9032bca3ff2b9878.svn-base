package kr.or.ddit.market.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.MemberaddressDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.MycouponDefaultVO;
import kr.or.ddit.vo.def.OrderdtDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;

/**
 * 마켓 회원의 상품구매중, 공통 부분을 처리하는 매퍼
 * @author jbk
 */
@Mapper
public interface MemberPurchasingCommonMapper {

	/**
	 * 회원의 기본배송지를 조회하는 메소드
	 * @return
	 */
	public MemberaddressDefaultVO selectMemberAddress(String memNo);


	/**
	 * 회원의 배송지 정보 리스트를 조회하는 메소드
	 * @return
	 */
	public List<MemberaddressDefaultVO> selectMemberAddressList(String memNo);


	/**
	 * 회원이 가진 쿠폰 리스트를 조회하는 메소드
	 * @param memNo
	 * @return
	 */
	public List<MycouponDefaultVO> selectMemberCouponList(String memNo);


	/**
	 * 신규 주문번호를 생성하는 메소드
	 * @return
	 */
	public String selectNewOrderId();


	/**
	 * DB에 주문정보, 주문상세정보를 추가하는 메소드
	 * @param memOrder
	 */
	public int insertOrder(@Param("newMemOrder") MemorderDefaultVO newMemOrder);


	/**
	 * DB에 결제정보를 추가하는 메소드
	 * @param newPayment
	 */
	public int insertPayment(PaymentDefaultVO newPayment);


	/**
	 * DB 마이쿠폰정보를 수정하는 메소드
	 * @param myCoupon
	 * @return
	 */
	public int updateMyCoupon(MycouponDefaultVO myCoupon);


	/**
	 * DB 회원의 마일리지 정보를 수정하는 메소드
	 * @param member
	 * @return
	 */
	public int updateMemberMileage(MemberDefaultVO member);


	/**
	 * DB 배송정보를 추가하는 메소드
	 * @param deliveryInfo
	 * @return
	 */
	public int insertDelivery(DeliveryDefaultVO  deliveryInfo);


	/**
	 * 전체 주문내역을 조회하는 메소드
	 * @param memNo
	 * @return
	 */
	public List<MemorderDefaultVO> selectMemOrderList(String memNo);


	/**
	 * 환불시, 이전쿠폰정보로 변경하는 메소드
	 * @return
	 */
	public int updateMyCouponBefore(MycouponDefaultVO beforeCoupon);


	/**
	 * 환불시, 배송정보를 업데이트 하는 메소드
	 * @param newDeliveryInfo
	 * @return
	 */
	public int updateDeliveryStatus(DeliveryDefaultVO newDeliveryInfo);


	/**
	 * 환불시, 본사수량을 복구하는 메소드
	 * @param orderDt
	 * @return
	 */
	public int updateOrderDtList(OrderdtDefaultVO orderDt);
	
	
	/**
	 * 환불시, 주문정보를 환불상태로 변경하는 메소드
	 * @return
	 */
	public int updateMarketOrderIncomeRefund(String orderDtlsId);


	/**
	 * 본사매출에 반영되지않은 주문정보를 조회하는 메소드
	 * @return
	 */
	public List<MemorderDefaultVO> selectNoneIncomeMemOrderList();


	/**
	 * 쇼핑몰 주문금액을 본사 매출에 반영하는 메소드
	 * @param paymentInfo
	 * @return
	 */
	public int insertMarketOrderAmountToSelling(MemorderDefaultVO memOrder);
	
	
	/**
	 * 본사매출에 반영한 후, 해당 주문정보를 반영상태로 표시하는 메소드
	 * @return
	 */
	public int updateMarketOrderIncomeSuccess(String orderDtlsId);

	
	/**
	 * 환불한 주문정보를 조회하는 메소드
	 * @return
	 */
	public List<MemorderDefaultVO> selectRefundIncomeMemOrderList();
	
	
	/**
	 * 쇼핑몰 환불금액을 본사 매출에 반영하는 메소드
	 * @return
	 */
	public int insertMarketOrderRefundAmountToAdminExp(MemorderDefaultVO memOrder);
}
