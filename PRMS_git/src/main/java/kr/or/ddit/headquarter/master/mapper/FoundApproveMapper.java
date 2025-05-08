package kr.or.ddit.headquarter.master.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Mapper
public interface FoundApproveMapper {

	/**
	 * 창업상담배정 리스트 맵퍼
	 * @param paging
	 * @return
	 */
	public List<FoundDefaultVO> selectFoundApproveList(PaginationInfo paging);

	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

	/**
	 * 창업상담일자, 상담직원 배정 업데이트 맵퍼
	 * @param foundNo
	 * @param empNo
	 * @param foundDe
	 */
	public void updateApproveFound(@Param("foundNo") String foundNo
								,@Param("empNo") String empNo, @Param("foundDe") String foundDe);
}
