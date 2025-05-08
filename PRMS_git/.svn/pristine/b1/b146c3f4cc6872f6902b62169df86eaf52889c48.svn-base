package kr.or.ddit.market.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Controller
@RequestMapping("/market/beauty")
public class BeautyPageController {

	@Autowired
	FranchiseInfoService service;

	@GetMapping
	public String beautyPage(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		PaginationInfo paging = new PaginationInfo(8,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		List<FranchiseDefaultVO> franchiseList = service.retrieveFranchiseList(paging);
		model.addAttribute("franchiseList", franchiseList);

		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "market:market/beautyPage";
	}

}
