package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Mapper
public interface FranEmerApproveMapper {


	/** 점장 긴급재고신청 검토리스트 매퍼
	 * @param inputData
	 * @return
	 */
	List<EmergencyDefaultVO> selectFranEmerFranInvApproveList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @param franchiseId
	 * @return
	 */
	int selectTotalRecord(@Param("paging") PaginationInfo paging, @Param("franchiseId") String franchiseId);

	/**
	 * 점장 긴급 재고 승인 신청상태 매퍼
	 * @param emerNo
	 * @param emerPartn
	 */
	void updateEmerApprove(@Param("emerNo") String emerNo, @Param("emerPartn") String emerPartn);

	/**
	 * 점장 긴급재고승인 승인 / 내 가맹점 재고 수량 차감 매퍼
	 * @param emerNo
	 */
	void updateMyFranEmerApproveInv(String emerNo);

	/**
	 * 점장 긴급재고승인 승인 / 다른 가맹점 재고 수량 추가 매퍼
	 * @param emerNo
	 */
	void updateOtherFranEmerApporveInv(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 내 가맹점 환불비용 지출 매퍼
	 * @param emerNo
	 */
	void insertMyFranEmerApproveExp(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 내 가맹점 환불비용 매출 매퍼
	 * @param emerNo
	 */
	void insertOtherFranEmerApproveSell(String emerNo);

	/**
	 * 점장 긴급재고승인 반려 / 반려사유 매퍼
	 * @param emer
	 */
	void updateEmerFranInvStatus(EmergencyDefaultVO emer);

	/**
	 * 승인 상대 empId 조회 매퍼
	 * @param emerNo
	 * @return
	 */
	String selectApproveYourEmpId(String emerNo);

}
