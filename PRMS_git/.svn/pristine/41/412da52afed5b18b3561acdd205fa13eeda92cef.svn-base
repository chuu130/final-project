package kr.or.ddit.franchise.franchisee.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Mapper
public interface FranHeadInvMapper {

	/**
	 * 점주 본사재고 리스트 매퍼
	 * @param paging
	 * @return
	 */
	List<ProdDefaultVO> selectFranHeadInvList(PaginationInfo paging);


	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);


}
