package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.CenterDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CenterDefaultMapper {
    public int deleteCenterBoard(String ctrBbsNo);

    public int insertCenterBoard(CenterDefaultVO row);

    public CenterDefaultVO selectByctrBbsNo(String ctrBbsNo);

    public List<CenterDefaultVO> selectAllCenterBoard(PaginationInfo paging);
   
    public List<CenterDefaultVO> selectAllCenterNonPaging();
    
    public int updateCenterBoard(CenterDefaultVO row);
    
    public List<CenterDefaultVO> selectAllMergeBoard();
    
    /**
	 * 게시글 목록수 조회
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
}