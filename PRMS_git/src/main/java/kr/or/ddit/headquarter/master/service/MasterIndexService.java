package kr.or.ddit.headquarter.master.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MasterProdSalseVO;
import kr.or.ddit.vo.MonthRevenue;

/**
 * 본사 메인페이지에 필요한 정보를 조회하는 매퍼
 * @author jbk
 */
public interface MasterIndexService {

	/**
	 * 금년 본사 총매출을 조회하는 메소드
	 * @return
	 */
	public long retrieveTotalRevenue();


	/**
	 * 금년 본사 쇼핑몰 총매출을 조회하는 메소드
	 * @return
	 */
	public long retrieveOnlineProdTotalRevenue();


	/**
	 * 금년 가맹점 매출을 조회하는 메소드
	 * @return
	 */
	public long retrieveTotalFranRevenue();


	/**
	 * 금년 가맹계약비 매출을 조회하는 메소드
	 * @return
	 */
	public long retrieveHeadFranStartRevenue();


	/**
	 * 오늘 가맹점 발주현황을 조회하는 메소드
	 * @return
	 */
	public List<HashMap<String, Integer>> retrieveTodayInvRequest();


	/**
	 * 오늘 쇼핑몰 주문현황을 조회하는 메소드
	 * @return
	 */
	public List<HashMap<String, Integer>> retrieveTodayOnlineRequest();


	/**
	 * 금년 온라인 상품 판매량과 발주승인된 상품수량을 통합하여 TOP5 상품 판매량을 구하는 메소드
	 * @return
	 */
	public List<MasterProdSalseVO> retriveYearProdCountTop5();


	/**
	 * 월별 쇼핑몰 판매금액 + 환불금액 리스트를 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> retrieveOnlineMonthTotal();


	/**
	 * 월별 가맹점으로부터 얻은 수익을 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> retrieveFranMonthTotal();


	/**
	 * 올해 본사 월별매출을 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> retrieveThisYearMonthRevenue();


	/**
	 * 작년 본사 월별매출을 조회하는 메소드
	 * @return
	 */
	public List<MonthRevenue> retrieveLastYearMonthRevenue();


	/**
	 * 오늘 창업상담 일정을 조회하는 메소드
	 * @return
	 */
	public HashMap<String, String> retrieveTodayFound();
}
