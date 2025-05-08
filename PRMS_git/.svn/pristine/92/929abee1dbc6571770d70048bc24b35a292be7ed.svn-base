package kr.or.ddit.headquarter.master.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.headquarter.master.mapper.MasterIndexMapper;
import kr.or.ddit.vo.MasterProdSalseVO;
import kr.or.ddit.vo.MonthRevenue;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MasterIndexServiceImpl implements MasterIndexService{

	private final MasterIndexMapper masterIndexMapper;

	@Override
	public long retrieveTotalRevenue() {
		return masterIndexMapper.selectTotalRevenue();
	}


	@Override
	public long retrieveOnlineProdTotalRevenue() {
		return masterIndexMapper.selectOnlineProdTotalRevenue();
	}


	@Override
	public long retrieveTotalFranRevenue() {

		// 1. 가맹점으로부터 재고수익을 구한다.

		// 1.1. 금년 가맹점 재고발주 비용을 조회한다.
		long headFranProdRevenue = masterIndexMapper.selectHeadFranProdRevenue();

		// 1.2. 금년 가맹점 재고환불 비용을 조회한다.
		long headFranProdRefund = masterIndexMapper.selectHeadFranProdRefund();

		// 2. 가맹비(메이커비용) 수익을 구한다.
		long headFranMakerRevenue = masterIndexMapper.selectHeadFranMakerRevenue();

		// 3. 합산한 값을 반환한다. | (발주비용 - 환불비용) + 메이커비용
		long totalFranRevenue = (headFranProdRevenue - headFranProdRefund) + headFranMakerRevenue;

		return totalFranRevenue;
	}


	@Override
	public long retrieveHeadFranStartRevenue() {
		return masterIndexMapper.selectHeadFranStartRevenue();
	}


	@Override
	public List<HashMap<String, Integer>> retrieveTodayInvRequest() {
		return masterIndexMapper.selectTodayInvRequest();
	}


	@Override
	public List<HashMap<String, Integer>> retrieveTodayOnlineRequest() {
		return masterIndexMapper.selectTodayOnlineRequest();
	}


	@Override
	public List<MasterProdSalseVO> retriveYearProdCountTop5() {
		return masterIndexMapper.selectTop5ProdList();
	}


	@Override
	public List<MonthRevenue> retrieveOnlineMonthTotal() {
		return masterIndexMapper.selectOnlineMonthTotal();
	}


	@Override
	public List<MonthRevenue> retrieveFranMonthTotal() {
		return masterIndexMapper.selectFranMonthTotal();
	}


	@Override
	public List<MonthRevenue> retrieveThisYearMonthRevenue() {
		return masterIndexMapper.selectThisYearMonthRevenue();
	}


	@Override
	public List<MonthRevenue> retrieveLastYearMonthRevenue() {
		return masterIndexMapper.selectLastYearMonthRevenue();
	}


	@Override
	public HashMap<String, String> retrieveTodayFound() {
		return masterIndexMapper.selectTodayFound();
	}

}
