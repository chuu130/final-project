package kr.or.ddit.franchise.staff.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Mapper
public interface StaffFranchiseMapper {

	/**
	 * 직원 근처 가맹점 조회 매퍼
	 * @param paging
	 * @return
	 */
	public List<FranchiseDefaultVO> selectStaffFranchiseList(HashMap<String, Object> inputData);


	/**
	 * 페이징
	 * @param paging
	 * @param empId
	 * @return
	 */
	public int selectTotalRecord(@Param("paging") PaginationInfo paging, @Param("empId") String empId);
}
