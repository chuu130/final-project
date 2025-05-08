package kr.or.ddit.headquarter.master.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.FranprodDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

/**
 * 가맹점 발주정보를 관리하는 매퍼
 * @author jbk
 */
@Mapper
public interface FranOrderMapper {

	/**
	 * 페이징을 위한 레코드수를 구하는 메소드
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfoOrder paging);


	/**
	 * 가맹점 발주정보 리스트를 조회하는 메소드
	 * @return
	 */
	public List<InvrequestDefaultVO> selectInvRequestList(PaginationInfoOrder paging);


	/**
	 * 발주번호를 이용해서 발주상세정보를 조회하는 메소드
	 * @param fireqId
	 * @return
	 */
	public InvrequestDefaultVO selectInvRequest(String fireqId);



	/**
	 * 가맹점 판매상품정보를 조회하는 메소드
	 * @param invrequest
	 * @return
	 */
	public List<FranprodDefaultVO> selectFranProd(InvrequestDefaultVO invrequest);


	/**
	 * 가맹점 판매상품 정보를 기반으로, 가맹점 재고수량을 변경하는 메소드
	 * @return
	 */
	public int updateInvFran(InventoryDefaultVO inventory);


	/**
	 * 본사 판매상품을 기반으로, 본사 재고수량을 변경하는 메소드
	 * @param prodId
	 * @return
	 */
	public int updateInvHead(AdmininvDefaultVO admininv);


	/**
	 * 발주상태를 변경하는 메소드
	 * @param invrequest
	 * @return
	 */
	public int updateFrieqSttusSuccess(InvrequestDefaultVO invrequest);


	/**
	 * 기존에 취급하지 않은 상품을 발주했을시, 가맹점 취급품목에 추가하는 메소드
	 * @param newFranProd
	 * @return
	 */
	public int insertFranProd(FranprodDefaultVO newFranProd);


	/**
	 * 기존에 취급하지 않은 상품을 발주했을시, 가맹점 재고품목에 추가하는 메소드
	 * @param inventory
	 * @return
	 */
	public int insertInventory(InventoryDefaultVO inventory);


	/**
	 * 본사에서 반려했을시, 본사의 지출정보에 반영하는 메소드
	 * @param rejectAmount
	 * @return
	 */
	public int insertRejectAdminexpMoney(InvrequestDefaultVO rejectedInvRequest);


	/**
	 * 본사에서 반려했을시, 해당 가맹점의 매출정보에 반영하는 메소드
	 * @param rejectAmount
	 * @return
	 */
	public int insertRejectFranMoney(InvrequestDefaultVO rejectedInvRequest);


	/**
	 * 본사에서 반려했을시, 발주상태를 반려로 변경하고 반려사유를 입력하는 메소드
	 * @param invRequest
	 * @return
	 */
	public int updateFrieqSttusReject(InvrequestDefaultVO invRequest);


	/**
	 * 주문정보의 발주처리날짜를 오늘로 변경하는 메소드
	 * @param invrequest
	 * @return
	 */
	public int updateFrieqUpdateDe(InvrequestDefaultVO invrequest);
}
