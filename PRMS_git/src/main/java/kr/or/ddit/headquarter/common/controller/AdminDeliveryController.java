package kr.or.ddit.headquarter.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.InvPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.headquarter.common.service.AdminDeliveryService;
import kr.or.ddit.vo.AdminDeliveryVO;
import kr.or.ddit.vo.HeadquarterProdVO;

@Controller
@RequestMapping("/main/master")
public class AdminDeliveryController {

	
	@Autowired
	private AdminDeliveryService service;
	
	@GetMapping("/deliveryList")
	public String deliveryList(@RequestParam(required = false, defaultValue = "1") int page
			,@ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
//		PaginationInfo paging = new PaginationInfo(5, 5);
//		paging.setPage(page);
//		paging.setSimpleCondition(simpleCondition);
		
		List<AdminDeliveryVO> deliveryList = service.selectDeliveryList();
		List<AdminDeliveryVO> IndeliveryList = service.selectInDeliveryList();
		List<AdminDeliveryVO> deliveryCompleteList = service.selectDeliveryCompleteList();
		
		model.addAttribute("deliveryList", deliveryList);
		model.addAttribute("IndeliveryList", IndeliveryList);
		model.addAttribute("deliveryCompleteList", deliveryCompleteList);
		
//		PaginationRenderer renderer = new InvPaginationRenderer();
//		String pagingHTML = renderer.renderPagination(paging);
//		model.addAttribute("pagingHTML", pagingHTML);
		
		return "master:master/adminDeliveryList";
	}
}
