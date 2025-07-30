package kr.or.ddit.commons.def.mapper;

import java.util.List;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.CenterDefaultVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CenterDefaultMapper {
	/**
	 * 게시글 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);

    public List<CenterDefaultVO> selectAllCenterBoard(PaginationInfo paging);
   
    public List<CenterDefaultVO> selectAllCenterNonPaging();
 
    public CenterDefaultVO selectByctrBbsNo(String ctrBbsNo);

    public int insertCenterBoard(CenterDefaultVO row);
    
    public int updateCenterBoard(CenterDefaultVO row);
    
    public int deleteCenterBoard(String ctrBbsNo);

    public List<CenterDefaultVO> selectAllMergeBoard();
    
}