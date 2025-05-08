package kr.or.ddit.franchise.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.common.service.FranSalesService;
import kr.or.ddit.vo.FranSalesVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;

@Controller
@RequestMapping("/main/franchisee")
public class FranByProdSaleController {
	
	@Autowired
	private FranSalesService service;
	
	@GetMapping("/franByProdSale")
	public String list( Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		 EmployeeDefaultVOWrapper franWrapper  = (EmployeeDefaultVOWrapper) sc.getAuthentication().getPrincipal();
		 EmployeeDefaultVO fran = franWrapper.getRealUser();
		 
		 String franchiseId = fran.getFranchiseId();
		
		 
		List<FranSalesVO> franTop5List = service.selectFranTopFirveProdName(franchiseId);
		
		model.addAttribute("franTop5List", franTop5List);		
		
		// 전체 상품 순이익 매출 
		List<FranSalesVO> franByProdList = service.selectFranByProdSales(franchiseId);
		
		model.addAttribute("franByProdList", franByProdList);
		return "franchisee:franchisee/franchiseByProdSale";
	}

}
