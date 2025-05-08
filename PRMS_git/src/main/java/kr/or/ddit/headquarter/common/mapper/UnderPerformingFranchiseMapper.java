package kr.or.ddit.headquarter.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.FranchiseVO;

@Mapper
public interface UnderPerformingFranchiseMapper {

	
	/**
	 * 올해 매장 전체 매출 조회
	 * @return
	 */
	public List<FranchiseVO> selectThisYearFranchiseSelling();
	
	/**
	 * 작년 매장 전체 매출 조회
	 * @return
	 */
	public List<FranchiseVO> selectLastYearFranchiseSelling();
	
	/**
	 * 올해 매장 전체 지출 조회
	 * @return
	 */
	public List<FranchiseVO> selectThisYearFranchiseExpense();
	
	/**
	 * 작년 매장 전체 지출 조회
	 * @return
	 */
	public List<FranchiseVO> selectLastYearFranchiseExpense();
	

}
