package kr.or.ddit.franchise.common.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.FranSalesVO;

public interface FranSalesService {
	/**
	 * 가맹점 매출조회
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranSalesFsel(String franId);
	
	/**
	 * 가맹점 지출조회
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranSalesFexps(String franId);
	
	/**
	 * 이번주 매출과 날짜 조회
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranThisWeekFsel(String franId);
	
	
	/**
	 * 저번주 매출과 날짜 조회
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranLastWeekFsel(String franId);
	
	public List<FranSalesVO> selectFranTopFiveProd(@Param("franId") String franId);
	
	public List<FranSalesVO> selectFranProdRate(@Param("franId") String franId);
	
	/**
	 * 호텔 체크인, 체크아웃, 예약취소 조회하는 리스트
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranHotelState(@Param("franId") String franId);
	
	
	/**
	 * 미용예약상태 조회하는 리스트 
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranBeautyState(@Param("franId") String franId);
	
	/**
	 * 가맹점 포스기 매출 TOP5 상품조회
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranTopFirveProdName(@Param("franId") String franId);
	
	/**
	 * 전체 상품별 매출 순이익
	 * @param franId
	 * @return
	 */
	public List<FranSalesVO> selectFranByProdSales(@Param("franId") String franId);
}
