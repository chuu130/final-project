package kr.or.ddit.headquarter.master.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.headquarter.master.service.MasterIndexService;
import kr.or.ddit.vo.MasterProdSalseVO;
import kr.or.ddit.vo.MonthRevenue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 본사 메인페이지에 필요한 정보를 조회하는 컨트롤러
 * @author jbk
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = {"/main/master"})
public class MasterIndexController {

	private final MasterIndexService masterIndexService;

	@GetMapping("masterpage.do")
	public String masterindex() {
		return "masterpage";
	}


	/**
	 * 본사 금년 매출정보를 조회한후 반환하는 메소드
	 * @param model
	 */
	@GetMapping("totalRevenue")
	public void totalRevenueProcess(
			Model model
	) {
		long totalRevenue = masterIndexService.retrieveTotalRevenue();
		long onlineProdTotalRevenue = masterIndexService.retrieveOnlineProdTotalRevenue();
		long totalFranRevenue = masterIndexService.retrieveTotalFranRevenue();
		long franStartRevenue = masterIndexService.retrieveHeadFranStartRevenue();

		model.addAttribute("totalRevenue", totalRevenue);
		model.addAttribute("onlineProdTotalRevenue", onlineProdTotalRevenue);
		model.addAttribute("totalFranRevenue", totalFranRevenue);
		model.addAttribute("franStartRevenue", franStartRevenue);
	}


	/**
	 * 오늘 가맹점 발주현황을 조회한 후, 반환하는 메소드
	 * @return
	 */
	@GetMapping("todayInvRequest")
	public void todayInvRequestProcess(
		Model model
	) {
		 List<HashMap<String, Integer>> todayInvRequest = masterIndexService.retrieveTodayInvRequest();
		 model.addAttribute("todayInvRequest", todayInvRequest);
	}


	/**
	 * 오늘 쇼핑몰 주문현황을 조회한 후, 반환하는 메소드
	 * @param model
	 */
	@GetMapping("todayOnlineRequest")
	public void todayOnlineRequestProcess(
		Model model
	) {
		List<HashMap<String, Integer>> todayOnlineRequest = masterIndexService.retrieveTodayOnlineRequest();
		model.addAttribute("todayOnlineRequest", todayOnlineRequest);
	}


	/**
	 * 금년 top5상품을 조회한 후, 반환하는 메소드
	 * @param model
	 */
	@GetMapping("top5Prod")
	public void top5ProdProcess(
		Model model
	) {
		List<MasterProdSalseVO> yearProdCountTop5 = masterIndexService.retriveYearProdCountTop5();
		model.addAttribute("yearProdCountTop5", yearProdCountTop5);
	}


	/**
	 * 쇼핑몰, 가맹점 월별매출을 집계한후, 반환하는 메소드
	 * @param model
	 */
	@GetMapping("totalMonthRevenue")
	public void totalMonthRevenueProcess(
		Model model
	) {
		List<MonthRevenue> onlineMonthTotal = masterIndexService.retrieveOnlineMonthTotal();
		List<MonthRevenue> franMonthTotal = masterIndexService.retrieveFranMonthTotal();

		model.addAttribute("onlineMonthTotal", onlineMonthTotal);
		model.addAttribute("franMonthTotal", franMonthTotal);
	}


	/**
	 * 작년과 올해 본사매출을 집계한후, 반환하는 메소드
	 * @param model
	 */
	@GetMapping("compareMonthRevenue")
	public void compareMonthRevenueProcess(
		Model model
	) {
		List<MonthRevenue> thisYearMonthRevenue = masterIndexService.retrieveThisYearMonthRevenue();
		List<MonthRevenue> lastYearMonthRevenue = masterIndexService.retrieveLastYearMonthRevenue();

		model.addAttribute("thisYearMonthRevenue", thisYearMonthRevenue);
		model.addAttribute("lastYearMonthRevenue", lastYearMonthRevenue);
	}


	/**
	 * 오늘 창업상담일정을 조회하는 메소드
	 * @param model
	 */
	@GetMapping("todayFound")
	public void todayFoundProcess(
		Model model
	) {
		HashMap<String, String> todayFound = masterIndexService.retrieveTodayFound();
		model.addAttribute("todayFound", todayFound);
	}
}
