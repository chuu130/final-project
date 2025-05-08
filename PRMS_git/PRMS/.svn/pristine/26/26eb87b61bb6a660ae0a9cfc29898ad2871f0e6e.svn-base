package kr.or.ddit.franchise.franchisee.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.def.EmployeeDefaultVO;

/**
 * 가맹점주 메인페이지에 필요한 정보를 조회하는 매퍼
 * @author jbk
 *
 */
@Mapper
public interface FranIndexMapper {

	/**
	 * 해당 가맹점의 총매출을 조회하는 메소드
	 * @param fran
	 * @return
	 */
	public int selectTotalRevenue(EmployeeDefaultVO fran);

	/**
	 * 해당 가맹점의 상품매출을 조회하는 메소드
	 * @param fran
	 * @return
	 */
	public int selectProductRevenue(EmployeeDefaultVO fran);

	/**
	 * 해당 가맹점의 미용매출을 조회하는 메소드
	 * @param fran
	 * @return
	 */
	public int selectBeautyRevenue(EmployeeDefaultVO fran);

	/**
	 * 해당 가맹점의 호텔매출을 조회하는 메소드
	 * @param fran
	 * @return
	 */
	public int selectHotelRevenue(EmployeeDefaultVO fran);

}
