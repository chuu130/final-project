package kr.or.ddit.market.member.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.SellingContentVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;


/**
 * 다건 주문을 처리하는 매퍼
 * @author jbk
 *
 */
@Mapper
public interface MemberMultiplePurchasingMapper {

	/**
	 * 본사 상품수량을 업데이트 하는 메소드
	 * @param admininvInfoList
	 * @return
	 */
	public int updateAdmininvQy(AdmininvDefaultVO admininvInfoList);


	/**
	 * 결제완료된 정보(주문, 주문상세, 결제)를 조회하는 메소드
	 * @return
	 */
	public MemorderDefaultVO selectMemOrder(String orderDtlsId);


	/**
	 * 장바구니 상품결제 완료후, 장바구니 정보를 삭제하는 메소드
	 * @return
	 */
	public int deleteCart(String memNo);
}
