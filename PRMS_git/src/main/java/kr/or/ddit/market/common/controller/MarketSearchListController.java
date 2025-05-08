package kr.or.ddit.market.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.headquarter.common.service.AdminInvService;
import kr.or.ddit.market.common.service.ProdService;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

@Controller
@RequestMapping("/market")
public class MarketSearchListController {

	@Autowired
	private ProdService service;

	/**
	 * 페이징 처리된 상품검색 메소드
	 * @param page
	 * @param simpleCondition
	 * @param search
	 * @param model
	 * @return
	 */
	@RequestMapping("search.do")
	public String searchProdList(@RequestParam(required = false ,defaultValue = "1") int page
								, SimpleCondition simpleCondition, Model model){

		PaginationInfo paging = new PaginationInfo(8,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<AdmininvDefaultVO> searchProdList = service.searchProdList(paging);
		model.addAttribute("aiList", searchProdList);

		PaginationRenderer rederer = new ThemeType1PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "market:market/marketSearch";
	}
}
