package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.EmergencyDefaultVO;
import kr.or.ddit.vo.def.EmergencydtDefaultVO;

@Mapper
public interface FranEmergencyMapper {

	/**
	 * 점장 긴급재고신청 맵퍼
	 * @param emergnecy
	 * @return
	 */
	int insertFranEmer(EmergencyDefaultVO emergnecy);

	/**
	 * 점장 긴급 재고 신청 목록 조회 매퍼
	 * @param inputData
	 * @return
	 */
	List<EmergencyDefaultVO> selectFranEmerFranInvApplyList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @param franchiseId
	 * @return
	 */
	int selectTotalRecord(@Param("paging")PaginationInfo paging, @Param("franchiseId") String franchiseId);

	/**
	 * 점장 긴급 재고 신청 내역 물품 리스트 매퍼
	 * @param emerNo
	 * @return
	 */
	List<EmergencydtDefaultVO> selectEmerDtList(String emerNo);

	/**
	 * 점장 긴급재고신청 취소 매퍼
	 * @param emerNo
	 * @param emerPartn
	 */
	void updateEmerApply(@Param("emerNo") String emerNo, @Param("emerPartn") String emerPartn);

	/**
	 * 점장 긴급 재고 신청 / 내 가맹점 신청비용 지출 매퍼
	 * @param emergnecy
	 */
	void insertMyFranEmerApplyExp(EmergencyDefaultVO emergnecy);

	/**
	 * 점장 긴급 재고 신청 / 다른 가맹점 신청비용 매출 매퍼
	 * @param emergnecy
	 */
	void insertOtherFranEmerApplySell(EmergencyDefaultVO emergnecy);

	/**
	 * 점장 긴급 재고 신청 / 내 가맹점 신청취소 비용 매출 매퍼
	 * @param emerNo
	 */
	void insertMyFranEmerApplyReturnSell(@Param("emerNo") String emerNo);

	/**
	 * 점장 긴급 재고 신청 / 다른 가맹점 신청취소 비용 지출 매퍼
	 * @param emerNo
	 */
	void insertOtherFranEmerApplyReturnExp(@Param("emerNo") String emerNo);

	/**
	 * 상대 empId 구하는 매퍼
	 * @param reqFranchiseId
	 * @return
	 */
	String selectYourEmpIdInfo(String reqFranchiseId);



}
