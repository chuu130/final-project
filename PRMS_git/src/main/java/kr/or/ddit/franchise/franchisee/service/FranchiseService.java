package kr.or.ddit.franchise.franchisee.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

public interface FranchiseService {
	public int deleteFranchise(String franchiseId);

    public int insertFranchise(FranchiseDefaultVO franchise);

    public FranchiseDefaultVO selectFranchise(@Param("franchiseId") String franchiseId);

    public List<FranchiseDefaultVO> selectFranchiseList(PaginationInfo paging);

    public int updateFranchise(FranchiseDefaultVO franchise);

    public void updateHotelCnt(@Param("franchiseId") String franchiseId);

    public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 해당 가맹점의 미용예약완료된 리스트 출력
	 */
	public List<FranchiseDefaultVO> selectbeautyList(String franchiseId);

	/**
	 * 해당 가맹점의 호텔예약완료된 리스트 출력
	 */
	public List<FranchiseDefaultVO> selecthotelList(String franchiseId);

	/**
	 * 가맹점 폐업 유무가 'N'인 리스트 출력
	 */
	public List<FranchiseDefaultVO> selectfranchiseclose();

	/**
	 * 가맹점 폐업 처리
	 */
	public int franchiseClose(String franchiseId);

	public int countfran();

	public List<FranchiseDefaultVO> selectFranchiseEmployees(String franchiseId);


}
