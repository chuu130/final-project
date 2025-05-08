package kr.or.ddit.franchise.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.franchise.common.service.FranSalesService;
import kr.or.ddit.vo.FranSalesVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;

@Controller
@RequestMapping("/main/franchisee")
public class FranSalesController {
	
	@Autowired
	private FranSalesService service;
	
	@GetMapping("/franSalesTerm")
	public String list( Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper emp = (EmployeeDefaultVOWrapper) sc.getAuthentication().getPrincipal();
		String franId = emp.getRealUser().getFranchiseId();

		List<FranSalesVO> franSalesFselList = service.selectFranSalesFsel(franId);
		List<FranSalesVO> franSalesFexpsList = service.selectFranSalesFexps(franId);
		
		model.addAttribute("franSalesFselList", franSalesFselList);
		model.addAttribute("franSalesFexpsList", franSalesFexpsList);
		
		return "franchisee:franchisee/franSalesTerm";
	}
}
