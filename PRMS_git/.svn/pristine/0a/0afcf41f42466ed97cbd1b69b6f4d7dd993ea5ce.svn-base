package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.EmergencyDefaultVO;
import kr.or.ddit.vo.def.EmergencydtDefaultVO;

public interface FranEmergencyService {

	/**
	 * 점장 긴급재고신청 메서드
	 * @param emergnecy
	 */
	void createFranEmer(EmergencyDefaultVO emergnecy);

	/**
	 * 점장 긴급 재고 신청 목록 조회 메서드
	 * @param inputData
	 * @return
	 */
	List<EmergencyDefaultVO> retrieveFranEmerFranInvApplyList(HashMap<String, Object> inputData);

	/**
	 * 점장 긴급 재고 신청 상세내역 메서드
	 * @param what
	 * @return
	 */
	List<EmergencydtDefaultVO> retrieveEmerDtList(String what);

	/**
	 * 점장 긴급 재고 신청취소 메서드
	 * @param emerNo
	 * @param emerPartn
	 */
	void modifyEmerApply(String emerNo, String emerPartn);

	/**
	 * 점장 긴급 재고 신청 / 내 가맹점 신청비용 지출 메서드
	 * @param emergnecy
	 */
	void createMyFranEmerApplyExp(EmergencyDefaultVO emergnecy);

	/**
	 *	점장 긴급 재고 신청 / 다른 가맹점 신청비용 매출 메서드
	 * @param emergnecy
	 */
	void createOtherFranEmerApplySell(EmergencyDefaultVO emergnecy);

	/**
	 * 점장 긴급 재고 신청 / 내 가맹점 신청취소 비용 매출 메서드
	 * @param emerNo
	 */
	void createMyFranEmerApplyReturnSell(String emerNo);

	/**
	 * 점장 긴급 재고 신청 / 다른 가맹점 신청취소 비용 지출 메서드
	 * @param emerNo
	 */
	void createOtherFranEmerApplyReturnExp(String emerNo);

	/**
	 * 상대 가맹점 empId 조회
	 * @param empId
	 * @return
	 */
	String retrieveYourEmpIdInfo(String reqFranchiseId);
}
