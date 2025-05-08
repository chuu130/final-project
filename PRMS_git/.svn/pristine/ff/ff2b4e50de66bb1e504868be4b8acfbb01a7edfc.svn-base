package kr.or.ddit.headquarter.master.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.AdminSalesVO;


@Mapper
public interface SalesMapper {
	List<AdminSalesVO> selectMonthSelling();
	List<AdminSalesVO> selectMonthExpense();
	
	
	/**
	 * 온라인 상품 매출 top5 상품 조회
	 * @return
	 */
	public List<AdminSalesVO> selectByTop5ProdList();
	
	/**
	 * 온라인 상품 매출 조회 리스트
	 * @return
	 */
	public List<AdminSalesVO> selectByProdSalesList();
}
