package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.SalesService;
import kr.or.ddit.vo.AdminSalesVO;

@Controller
@RequestMapping("/main/master")
public class SalesController {

	@Autowired
	SalesService service;

	@GetMapping("/salesTerm")
	public String saleslist(Model model) {

		List<AdminSalesVO> selling = service.retrieveMonthSelling();
		List<AdminSalesVO> expense = service.retrieveMonthExpense();

		model.addAttribute("selling",selling);
		model.addAttribute("expense",expense);

		return "master:master/salesTerm";
	}

	@GetMapping("/salesProd")
	public String prodsaleslist(Model model) {
		
		
		List<AdminSalesVO> prodTop5List = service.selectByTop5ProdList();
		List<AdminSalesVO> prodSalesList = service.selectByProdSalesList();
		
		model.addAttribute("prodTop5List", prodTop5List);
		model.addAttribute("prodSalesList", prodSalesList);

		return "master:master/salesProd";
	}
}
