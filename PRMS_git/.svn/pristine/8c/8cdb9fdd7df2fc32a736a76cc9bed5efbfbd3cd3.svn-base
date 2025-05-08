package kr.or.ddit.headquarter.common.service;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HeadquarterDefaultVO;
import kr.or.ddit.vo.def.HotelroomDefaultVO;

/**
 * 가맹점 정보 관리 서비스
 * @author ahj
 *
 */
public interface FranchiseInfoService {

	/**
	 * 전국 모든 가맹점 리스트 조회
	 * @param paging
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveFranchiseList(PaginationInfo paging);

	/**
	 * 하나의 가맹점 상세정보 조회
	 * @param franchiseId
	 * @return
	 */
	public FranchiseDefaultVO retrieveFranchiseDetail(String franchiseId);

	/**
	 * 가맹점 정보 수정
	 * @param franchise
	 */
	public void modifyFranchise(FranchiseDefaultVO franchise);

	/**
	 * 가맹점 호텔 수를 갱신
	 * @param franchiseId
	 */
	public void modifyHotelCnt(String franchiseId);

	/**
	 * 카카오맵 가맹점 리스트 비동기 조회
	 * @return
	 */
	public List<FranchiseDefaultVO> retrieveFranchiseInfoList();

	/**
	 * 카카오맵 본사 정보 비동기 조회
	 * @param empId
	 * @return
	 */
	public HeadquarterDefaultVO retrieveHeadInfo(String empId);
}
