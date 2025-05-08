package kr.or.ddit.market.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.commons.def.mapper.ProdDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Mapper
public interface ProdMapper extends ProdDefaultMapper {


	/**
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);


    /**
     * 상품검색
     * @param paging
     * @return
     */
    List<AdmininvDefaultVO> searchProdList(PaginationInfo paging);
    

}
