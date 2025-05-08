package kr.or.ddit.headquarter.master.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.MasterProdSalseVO;
import kr.or.ddit.vo.MonthRevenue;

/**
 * 본사 메인페이지에 필요한 정보를 조회하는 매퍼
 * @author jbk
 */
@Mapper
public interface MasterIndexMapper {

	/**
	 * 금년 본사 총매출을 조회하는 메소드
	 * @return
	 */
	public long selectTotalRevenue();


	/**
	 * 금년 쇼핑몰 총매출을 조회하는 메소드
	 * @return
	 */
	public long selectOnlineProdTotalRevenue();


	/**
	 * 금년 전체가맹점 매출정보(상품, 미용, 호텔)를 조회하는 메소드
	 * @return
	 */
	public long selectFranRevenue();


	/**
	 * 금년 전체가맹점 환불정보(상품, 미용, 호텔)을 조회하는 메소드
	 * @return
	 */
	public long selectFranRefundRevenue();


	/**
	 * 금년 본사매출중, 가맹점 재고발주 비용을 조회하는 메소드
	 * @return
	 */
	public long selectHeadFranProdRevenue();


	/**
	 * 금년 본사지출중, 가맹점 재고환불 비용을 조회하는 메소드
	 * @return
	 */
	public long selectHeadFranProdRefund();


	/**
	 * 금년 본사매출중, 가맹비를 조회하는 메소드
	 * @return
	 */
	public long selectHeadFranMakerRevenue();


	/**
	 * 금년 본사매출중, 가맹계약비를 조회하는 쿼리
	 * @return
	 */
	public long selectHeadFranStartRevenue();


	/**
	 * 오늘 가맹점 발주현황을 조회하는 메소드
	 * @return
	 */
	public List<HashMap<String, Integer>> selectTodayInvRequest();


	/**
	 * 오늘 쇼핑몰 주문현황을 조회하는 쿼리
	 * @return
	 */
	public List<HashMap<String, Integer>> selectTodayOnlineRequest();


	/**
	 * 금년 온라인 상품별 판매량을 조회하는 메소드
	 * @return
	 */
	public List<MasterProdSalseVO> selectOnlineProdCount();


	/**
	 * 금년 가맹점 발주승인된 상품 수량을 조회하는 메소드
	 * @return
	 */
	public List<MasterProdSalseVO> selectFranProdInvCount();


	/**
	 * 금년 온라인 상품 판매량과 발주승인된 상품수량을 통합하여 TOP5 상품 판매량을 구하는 메소드
	 * @return
	 */
	public List<MasterProdSalseVO> selectTop5ProdList();


	/**
	 * 월별 쇼핑몰 판매금액 + 환불금액 리스트를 조회하는 쿼리 (월, 판매, 환불)
	 * @return
	 */
	public List<MonthRevenue> selectOnlineMonthTotal();


	/**
	 * 월별 가맹점으로부터 얻은 수익을 조회하는 메소드(월, 발주, 발주취소)
	 * @return
	 */
	public List<MonthRevenue> selectFranMonthTotal();


	/**
	 * 올해 본사 월별매출을 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> selectThisYearMonthRevenue();


	/**
	 * 작년 본사 월별매출을 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> selectLastYearMonthRevenue();


	/**
	 * 오늘 창업상담일정을 조회하는 쿼리
	 * @return
	 */
	public HashMap<String, String> selectTodayFound();
}
