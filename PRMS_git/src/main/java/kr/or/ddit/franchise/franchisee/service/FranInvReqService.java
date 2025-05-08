package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.FiorderDefaultVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

public interface FranInvReqService {

	/**
	 * 점장 재고신청 메서드
	 * @param invReq
	 * @param empIdd
	 */
	void createFranInvReq(InvrequestDefaultVO invReq, String empId);

	/**
	 * 점장 재고 발주신청 내역 메서드
	 * @param inputData
	 * @return
	 */
	List<InvrequestDefaultVO> retrieveInvReqList(HashMap<String, Object> inputData);

	/**
	 * 점장 재고 발주신청 상세내역 메서드
	 * @param what
	 * @return
	 */
	List<FiorderDefaultVO> retrieveFiOrderList(String fireqId);

	/**
	 * 점장 재고 발주신청 취소 메서드
	 * @param fireqId
	 * @param fireqSttus
	 */
	void modifyInvReq(String fireqId, String fireqSttus);

	/**
	 * 점장 재고 발주신청 / 가맹점 발주비용지출 메서드
	 * @param invReq
	 */
	void createFranApplyInvReqExp(InvrequestDefaultVO invReq);

	/**
	 * 점장 재고 발주신청 / 가맹점 재고매출 메서드
	 * @param invReq
	 */
	void createAdminApplyInvReqSell(InvrequestDefaultVO invReq);

	/**
	 * 점장 재고 발주신청취소 / 가맹점 발주취소 매출 메서드
	 * @param fireqId
	 */
	void createMyHeadInvReqReturnSell(String fireqId);

	/**
	 * 점장 재고 발주신청취소 / 본사 발주취소 매출 메서드
	 * @param fireqId
	 */
	void createAdminHeadInvReqReturnExp(String fireqId);

}
