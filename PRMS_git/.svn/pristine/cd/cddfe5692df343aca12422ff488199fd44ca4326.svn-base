package kr.or.ddit.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.FoundDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Mapper
public interface FoundMapper extends FoundDefaultMapper {

	/**
	 *	창업상담문의 등록 맵퍼
	 */
	@Override
	public int insertFound(FoundDefaultVO foundVO);

	/**
	 *	창업상담검토 리스트 맵퍼
	 */
	public List<FoundDefaultVO> selectFoundList(PaginationInfo paging);


	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);


	/**
	 *	창업상담 검토 승인 여부 맵퍼
	 */
	public int updateFound(@Param("foundNo") String foundNo, @Param("foundConfmAt")String foundConfmAt);


	/**
	 * 창업 내용
	 * @param foundNo
	 * @return
	 */
	public FoundDefaultVO selectFoundDetail(@Param("foundNo") String foundNo);


	/**
	 * 창업상담 통과 리스트 매퍼
	 * @return
	 */
	public List<FoundDefaultVO> foundSuccessList();


	public FoundDefaultVO Foundlicense(FoundDefaultVO Foundvo);

	public List<FoundDefaultVO> foundAtList();

	public FoundDefaultVO selectfound(String foundNo);

	public int foundSideSeupdate(String foundNo);
}
