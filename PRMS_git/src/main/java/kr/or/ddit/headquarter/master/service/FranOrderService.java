package kr.or.ddit.headquarter.master.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

/**
 * 가맹점 발주정보를 관리하는 서비스
 * @author jbk
 */
public interface FranOrderService {

	/**
	 * 가맹점 발주건수를 조회하는 메소드
	 * @return
	 */
	public int retrieveFranOrderCount(PaginationInfoOrder paging);

	/**
	 * 가맹점 발주리스트를 조회하는 메소드
	 * @param paging
	 * @return
	 */
	public List<InvrequestDefaultVO> retrieveFranOrderList(PaginationInfoOrder paging);


	/**
	 * 발주번호를 이용해서 발주상세정보를 조회하는 메소드
	 * @param franOrderNo
	 * @return
	 */
	public InvrequestDefaultVO retrieveFranOrderDt(String franOrderNo);


	/**
	 * 발주번호를 이용해서 가맹점과 본사의 재고수량을 수정하는 메소드
	 * @param franOrderNo
	 * @return
	 */
	public void modifyInvFranAndHead(String franOrderNo);


	/**
	 * 주문번호를 이용해서 가맹점과 본사의 재고, 지출, 매출, 발주상태를 수정하는 메소드
	 * @param franOrderNo
	 */
	public void modifyInvAndMoneyToFranAndHead(InvrequestDefaultVO inputInvRequest);
}
