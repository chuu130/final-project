package kr.or.ddit.market.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.market.common.service.ProdService;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

@Controller
@RequestMapping("/market/{partprodSe}")
public class MarketCategoryListController {

	@Autowired
	private ProdService service;

	@RequestMapping({"", "search.do"})
	public String categoryProdList(@PathVariable String partprodSe, @RequestParam(required = false ,defaultValue = "1") int page
			, SimpleCondition simpleCondition, Model model) {

		PaginationInfo paging = new PaginationInfo(8,5);
		paging.addDetailCondition("partprodSe", partprodSe); //카테고리 조건 셋팅
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
