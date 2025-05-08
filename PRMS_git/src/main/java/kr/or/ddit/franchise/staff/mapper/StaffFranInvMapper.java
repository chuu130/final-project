package kr.or.ddit.franchise.staff.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Mapper
public interface StaffFranInvMapper {

	/**
	 * 직원 자사 재고 조회 맵퍼
	 * @param inputData
	 * @return
	 */
	public List<InventoryDefaultVO> selectStaffFranInvList(HashMap<String, Object> inputData);

	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(@Param("paging") PaginationInfo paging, @Param("franchiseId") String franchiseId);
}
