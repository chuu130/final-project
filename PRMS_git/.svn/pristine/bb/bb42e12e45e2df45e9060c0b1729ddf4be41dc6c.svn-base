package kr.or.ddit.franchise.franchisee.service;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.def.EmergencyDefaultVO;

public interface FranEmerApproveService {

	/**
	 * 점장 긴급재고신청 검토 리스트 메서드
	 * @param inputData
	 * @return
	 */
	List<EmergencyDefaultVO> retrieveFranEmerFranInvApporveList(HashMap<String, Object> inputData);

	/**
	 * 점장 긴급재고승인 메서드
	 * @param emerNo
	 * @param emerPartn
	 */
	void modifyEmerApprove(String emerNo, String emerPartn);

	/**
	 * 점장 긴급재고승인 승인 / 내 가맹점 재고 수량 차감 메서드
	 * @param emerNo
	 */
	void modifyMyFranEmerApproveInv(String emerNo);

	/**
	 * 점장 긴급재고승인 승인 / 다른 가맹점 재고 수량 추가 메서드
	 * @param emerNo
	 */
	void modifyOtherFranEmerApporveInv(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 내 가맹점 환불비용 지출 메서드
	 * @param emerNo
	 */
	void createMyFranEmerApproveExp(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 다른 가맹점 환불비용 매출 메서드
	 * @param emerNo
	 */
	void createOtherFranEmerApproveSell(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 반려사유 메서드
	 * @param emer
	 */
	void modifyEmerFranInvStatus(EmergencyDefaultVO emer);

	/**
	 * 승인 상대 empId 조회 메서드
	 * @param emerNo
	 * @return
	 */
	String retrieveApproveYourEmpId(String emerNo);

}
