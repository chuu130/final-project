package kr.or.ddit.headquarter.common.controller;

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
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;

@Controller
@RequestMapping("/main/master")
public class AdminFranSalesController {
	@Autowired
	private FranSalesService service;
	
	@GetMapping("/adminFranSalesTerm")
	public String list( Model model) {
		
		String franId = "1001";
		
		List<FranSalesVO> franSalesFselList = service.selectFranSalesFsel(franId);
		List<FranSalesVO> franSalesFexpsList = service.selectFranSalesFexps(franId);
		
		model.addAttribute("franSalesFselList", franSalesFselList);
		model.addAttribute("franSalesFexpsList", franSalesFexpsList);
		
		return "master:master/adminFranSalesTerm";
	}
}
