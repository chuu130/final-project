package kr.or.ddit.market.member.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PaymentInfoVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import kr.or.ddit.vo.def.PaymentDefaultVO;

/**
 * 단건 주문을 처리하는 매퍼
 * @author jbk
 *
 */
@Mapper
public interface MemberSinglePurchasingMapper {

	/**
	 * 본사 상품수량을 업데이트하는 메소드
	 * @param admininvInfo
	 * @return
	 */
	public int updateAdmininvQy(AdmininvDefaultVO admininvInfo);


	/**
	 * 온라인 상품 판매금액을 본사 매출에 반영하는 메소드
	 * @return
	 */
	public int insertMarketSingleOrderAmountToSelling(PaymentInfoVO paymentInfo);


	/**
	 * 결제완료된 정보(주문, 주문상세, 결제)를 조회하는 메소드
	 * @return
	 */
	public MemorderDefaultVO selectMemOrder(String orderDtlsId);

}
