package kr.or.ddit.commons.def.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HeadquarterDefaultVO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface FranchiseDefaultMapper {
	public int deleteFranchise(String franchiseId);

    public int insertFranchise(FranchiseDefaultVO franchise);

    public FranchiseDefaultVO selectFranchise(@Param("franchiseId") String franchiseId);

    public List<FranchiseDefaultVO> selectFranchiseList(PaginationInfo paging);

    public int updateFranchise(FranchiseDefaultVO franchise);

    public int updateHotelCnt(HashMap<String, String> franchiseId);

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
	 * 미용예약번호 중복 체크
	 */
	public int checkbeautyNo(String resBeautyNo);

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

	/**
	 * 카카오맵 가맹점 리스트 조회 비동기
	 * @return
	 */
	public List<FranchiseDefaultVO> selectFranchiseInfoList();

	/**
	 * 카카오맵 본사 정보 조회 비동기
	 * @param empId
	 * @return
	 */
	public HeadquarterDefaultVO selectHeadInfo(String empId);


}