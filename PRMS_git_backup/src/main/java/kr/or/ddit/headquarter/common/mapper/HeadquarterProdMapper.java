package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.commons.def.mapper.ProdDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.HeadquarterProdVO;

@Mapper
public interface HeadquarterProdMapper extends ProdDefaultMapper{

	/** 
	 * 페이징
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	
	public int selectDrowdownTotalRecord(@Param("name") String name);
	
	/**
	 * admininv, partprod, prod조인한 결과 조회하는 쿼리문(상품이미지)
	 * @return
	 */
	public List<HeadquarterProdVO> selectHeadquarterProdList(@Param("paging") PaginationInfo paging, @Param("firstRecord") int firstRecord, @Param("lastRecord") int lastRecord);
	
	
	/**
	 * 상품조회페이지에서 상품상세페이지 조회
	 * @param prodId
	 * @return
	 */
	public HeadquarterProdVO selectProdDetail(String prodId);
	
	
	/**
	 * 드롭다운한 이름(간식, 사료, 장난감)이 포함된 결과를 조회
	 * @param name
	 * @param paging
	 * @return
	 */
	public List<HeadquarterProdVO> selectProdDropdownList(@Param("name") String name,@Param("firstRecord") int firstRecord,@Param("lastRecord") int lastRecord,@Param("paging") PaginationInfo paging );
}
