package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FiorderDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

@Mapper
public interface FranInvReqMapper {

	/**
	 * 점장 재고신청 맵퍼
	 * @param invReq
	 * @return
	 */
	int insertFranInvReq(@Param("invReq") InvrequestDefaultVO invReq,@Param("empId") String empId);

	/**
	 * 점장 재고발주신청 리스트 맵퍼
	 * @param inputData
	 * @return
	 */
	List<InvrequestDefaultVO> selectFranInvReqList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @param franchiseId
	 * @return
	 */
	int selectTotalRecord(@Param("paging")PaginationInfo paging, @Param("franchiseId") String franchiseId);

	/**
	 * 점장 발주내역 물품 리스트 맵퍼
	 * @param fireqId
	 * @return
	 */
	List<FiorderDefaultVO> selectFiOrderList(@Param("fireqId") String fireqId);

	/**
	 * 점장 재고발주신청 취소 맵퍼
	 * @param fireqId
	 * @param fireqSttus
	 */
	void updateInvReq(@Param("fireqId") String fireqId, @Param("fireqSttus") String fireqSttus);

	/**
	 * 점장 재고발주신청 / 가맹점 발주비용지출 맵퍼
	 * @param invReq
	 */
	void insertFranApplyInvReqExp(InvrequestDefaultVO invReq);

	/**
	 * 점장 재고발주신청 / 본사 재고매출 맵퍼
	 * @param invReq
	 */
	void insertAdminApplyInvReqSell(InvrequestDefaultVO invReq);

	/**
	 * 점장 재고 발주신청취소 / 가맹점 발주취소 매출 맵퍼
	 * @param fireqId
	 */
	void insertMyHeadInvReqReturnSell(String fireqId);

	/**
	 * 점장 재고 발주신청취소 / 본사 발주취소 지출 맵퍼
	 * @param fireqId
	 */
	void insertAdminHeadInvReqReturnExp(String fireqId);
}
