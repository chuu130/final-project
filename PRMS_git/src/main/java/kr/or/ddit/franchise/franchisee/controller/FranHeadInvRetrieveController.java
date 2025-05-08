package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.franchise.franchisee.service.FranHeadInvService;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.ProdDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranHeadInvRetrieveController {

	@Autowired
	FranHeadInvService service;

	@GetMapping("franHeadInvList.do")
	public String franRetrieveHeadInvList(@RequestParam(required = false ,defaultValue = "1") int page
											, SimpleCondition simpleCondition
											, Model model
											, Authentication authentication
	) {
		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		model.addAttribute("franchiseId",realUser.getFranchiseId());

		PaginationInfo paging = new PaginationInfo(8,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<ProdDefaultVO> adminInvList = service.retrieveFranHeadInvList(paging);
		model.addAttribute("aiList", adminInvList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "franchisee:franchisee/franHeadInvList";
	}
}
