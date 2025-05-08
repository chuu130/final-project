package kr.or.ddit.franchise.franchisee.controller;

import java.util.HashMap;
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
import kr.or.ddit.franchise.franchisee.service.FranEmerFranInvService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranEmerFranInvRetrieveController {

	@Autowired
	FranEmerFranInvService service;

	@GetMapping("franEmerFranInvList.do")
	public String staffRetrieveEmerFranprodList(@RequestParam(required = false ,defaultValue = "1") int page
			, String what
			, SimpleCondition simpleCondition
			, Model model
			, Authentication authentication
	) {

		PaginationInfo paging = new PaginationInfo(8,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		HashMap<String, Object> inputData = new HashMap<String, Object>();
		model.addAttribute("franchiseId",realUser.getFranchiseId());

		inputData.put("paging", paging);
		inputData.put("what", what);
		inputData.put("franchiseId",realUser.getFranchiseId());

		List<FranchiseDefaultVO> franList = service.retrieveFranFranchiseList(realUser.getFranchiseId());
		model.addAttribute("franList",franList);

		List<InventoryDefaultVO> franinvList = service.retrieveFranEmerFranInvList(inputData);
		model.addAttribute("fiList",franinvList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("hash", "franEmerFranInvList");


		return "franchisee:/franchisee/franEmerFranInvList";


	}

}
