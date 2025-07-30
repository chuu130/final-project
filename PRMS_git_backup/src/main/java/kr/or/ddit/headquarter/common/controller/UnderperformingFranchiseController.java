package kr.or.ddit.headquarter.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.common.service.UnderPerformingFranchiseSerivce;
import kr.or.ddit.vo.FranchiseVO;

@Controller
@RequestMapping("/main/master")
public class UnderperformingFranchiseController {

	@Autowired
	UnderPerformingFranchiseSerivce service;
	
	@GetMapping("underPerformingFranchiseList")
	public String underPerformingFranchiseList(Model model) {
		
		List<FranchiseVO> thisYearSellingList = service.selectThisYearFranchiseSelling();
		List<FranchiseVO> thisYearExpenseList = service.selectThisYearFranchiseExpense();
		List<FranchiseVO> LastYearSellingList = service.selectLastYearFranchiseSelling();
		List<FranchiseVO> LastYearExpenseList = service.selectLastYearFranchiseExpense();
		
		model.addAttribute("thisYearSellingList", thisYearSellingList);
		model.addAttribute("thisYearExpenseList", thisYearExpenseList);
		model.addAttribute("LastYearSellingList", LastYearSellingList);
		model.addAttribute("LastYearExpenseList", LastYearExpenseList);
		
		
		return "master:master/underPerformingFranchiseList";
	}
}
