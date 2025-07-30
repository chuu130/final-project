package kr.or.ddit.headquarter.master.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;

/**
 * 온라인 주문정보를 관리하는 매퍼
 * @author jbk
 */
public interface OnlineOrderService {

	/**
	 * 온라인 회원의 주문리스트 개수를 조회하는 매소드
	 * @return
	 */
	public int retriveMemOrderCount(PaginationInfoOrder paging);

	/**
	 * 온라인 회원의 주문리스트를 조회하는 메소드
	 * @return
	 */
	public List<MemorderDefaultVO> retriveMemOrderList(PaginationInfoOrder paging);


	/**
	 * 주문번호를 이용해서 주문상세정보를 조회하는 메소드
	 * @param memOrderNo
	 * @return
	 */
	public MemorderDefaultVO retrieveMemOrderDt(String memOrderNo);


	/**
	 * 주문번호를 이용해서 발송처리를 하는 메소드
	 * @param memOrderNo
	 * @return
	 */
	public boolean modifyDlvySttus(String memOrderNo);


	/**
	 * 배송정보를 스케쥴링하는 메소드
	 */
	public void scheduleDlvySttus();
}
