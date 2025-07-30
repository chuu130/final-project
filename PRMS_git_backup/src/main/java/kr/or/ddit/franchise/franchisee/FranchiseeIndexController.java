package kr.or.ddit.franchise.franchisee;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.franchise.common.service.FranSalesService;
import kr.or.ddit.franchise.franchisee.service.FranExpenseService;
import kr.or.ddit.franchise.franchisee.service.FranIndexService;
import kr.or.ddit.headquarter.master.service.SellingService;
import kr.or.ddit.vo.FranSalesVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.ExpenseDefaultVO;
import kr.or.ddit.vo.def.SellingDefaultVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = {"/main/franchisee"})
@RequiredArgsConstructor
public class FranchiseeIndexController {

	private final FranIndexService franIndexService;

	private final FranSalesService franSalesService;


	private EmployeeDefaultVO fran;

	private SellingService selService;

	private FranExpenseService expenseService;

	/**
	 * 매월 1일 매출 가맹비 적용
	 */
	@Scheduled(cron = "0 0 0 1 * *")
	public void runPerCronSetting() {
		// 가맹점 총매출
		int totalSalesAmount = franIndexService.retrieveTotalRevenue(fran);
		// 가맹점 총매출에 가맹비 적용
		String franchiseAmount = Integer.toString(totalSalesAmount/50);

		SellingDefaultVO selVO = new SellingDefaultVO();
		selVO.setSelngSe("COMN17DT001");
		selVO.setSelngNm(fran.getFranchiseId()+" 가맹비");
		selVO.setSelngCn("가맹비(메이커비용)");
		selVO.setHqId("HEAD1");
		selVO.setSelngAmount(franchiseAmount);
		// 가맹비를 본사 매출에 등록
		selService.insertSelling(selVO);

		ExpenseDefaultVO expenseVO = new ExpenseDefaultVO();
		expenseVO.setFexpsAmount(Long.parseLong(franchiseAmount));
		expenseVO.setFranchiseeId(fran.getFranchiseId());
		expenseVO.setFexpsSe("COMN16DT008");
		expenseVO.setFexpsNm("가맹비");
		expenseVO.setFexpsCn("가맹비(메이커비용)");
		// 가맹비를 해당 가맹점 지출비용에 등록
		expenseService.insertExpense(expenseVO);
	}

	@GetMapping("franchiseepage.do")
	public String franchiessindex(
			Model model
	) {
		 // 로그인한 사용자의 프랜자이즈 정보를 구한다.

		SecurityContext sc = SecurityContextHolder.getContext();
		 EmployeeDefaultVOWrapper franWrapper  = (EmployeeDefaultVOWrapper) sc.getAuthentication().getPrincipal();
		 EmployeeDefaultVO fran = franWrapper.getRealUser();

		 String franchiseId = fran.getFranchiseId();

		List<FranSalesVO> franThisWeekSale = franSalesService.selectFranThisWeekFsel(franchiseId);
		List<FranSalesVO> franLastWeekSale = franSalesService.selectFranLastWeekFsel(franchiseId);

		// 지난주 대비 매출
		model.addAttribute("franThisWeekSale", franThisWeekSale);
		model.addAttribute("franLastWeekSale", franLastWeekSale);

		//포스기 상품 매출 top5 조회
		List<FranSalesVO> franTop5List = franSalesService.selectFranTopFiveProd(franchiseId);

		model.addAttribute("franTop5List", franTop5List);

		//가맹점 서비스별 매출 조회
		List<FranSalesVO> prodRateList = franSalesService.selectFranProdRate(franchiseId);

		model.addAttribute("prodRateList", prodRateList);

		// 호텔, 미용 예약현황 조회
		List<FranSalesVO> hotelResStateList = franSalesService.selectFranHotelState(franchiseId);
		List<FranSalesVO> beautyResStateList = franSalesService.selectFranBeautyState(franchiseId);

		model.addAttribute("hotelResStateList", hotelResStateList);
		model.addAttribute("beautyResStateList", beautyResStateList);

		int totalSalesAmount = franIndexService.retrieveTotalRevenue(fran);
		model.addAttribute("totalSalesAmount", totalSalesAmount);
		int productSalesAmount = franIndexService.retrieveProductRevenue(fran);
		model.addAttribute("productSalesAmount", productSalesAmount);
		int beautySalesAmount = franIndexService.retrieveBeautyRevenue(fran);
		model.addAttribute("beautySalesAmount", beautySalesAmount);
		int hotelSalesAmount = franIndexService.retrieveHotelRevenue(fran);
		model.addAttribute("hotelSalesAmount", hotelSalesAmount);

		return "franchiseepage";
	}

	/**
	 * 총매출을 구한으 전달하는 메소드
	 * @author jbk
	 * @return
	 */
	@GetMapping("totalRevenue")
	@ResponseBody
	public int totalRevenue() {
		return franIndexService.retrieveTotalRevenue(fran);
	}
}
