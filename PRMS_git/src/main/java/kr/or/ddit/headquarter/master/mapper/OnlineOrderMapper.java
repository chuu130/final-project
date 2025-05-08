package kr.or.ddit.headquarter.master.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;

/**
 * 온라인 주문정보를 관리하는 매퍼
 * @author jbk
 */
@Mapper
public interface OnlineOrderMapper {

	/**
	 * 페이징을 위한 레코드수를 구하는 메소드
	 * @return
	 */
	public int selectTotalRecord(PaginationInfoOrder paging);


	/**
	 * 온라인 마켓의 주문내역을 조회하는 메소드
	 * @return
	 */
	public List<MemorderDefaultVO> selectMemOrderList(PaginationInfoOrder paging);


	/**
	 * 주문번호를 이용해서 주문상세정보를 조회하는 메소드
	 * @param memOrderNo
	 * @return
	 */
	public MemorderDefaultVO selectMemOrderDt(String orderDtlsId);


	/**
	 * 주문번호를 이용해서 발송처리를 하는 메소드
	 * @param orderDtlsId
	 * @return
	 */
	public int updateDlvySttus(String orderDtlsId);


	/**
	 * 배송중인 주문정보를 조회한다.
	 * @return
	 */
	public List<MemorderDefaultVO> selectDlveringMemOrder();


	/**
	 * 배송완료 처리를하는 메소드
	 * @return
	 */
	public int updateDlvySttusSuccess(MemorderDefaultVO dlveringMemOrder);
}
