package kr.or.ddit.franchise.franchisee.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Mapper
public interface FranFranchiseMapper {

	/**
	 * 점장 근처 가맹점 조회 매퍼
	 * @param inputData
	 * @return
	 */
	public List<FranchiseDefaultVO> selectFranFranchiseList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @param empId
	 * @return
	 */
	public int selectTotalRecord(@Param("paging") PaginationInfo paging, @Param("empId") String empId);

	/**
	 * 카카오맵 자기가맹점 정보 매퍼
	 * @param franchiseId
	 * @return
	 */
	public FranchiseDefaultVO selectMyFranchiseInfo(String franchiseId);

	/**
	 * 카카오맵 다른 가맹점 정보 매퍼
	 * @param inputData
	 * @return
	 */
	public List<FranchiseDefaultVO> selectKakaoFranchiseList(HashMap<String, Object> inputData);
}
