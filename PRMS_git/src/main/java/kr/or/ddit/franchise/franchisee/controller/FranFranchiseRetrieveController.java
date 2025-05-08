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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.franchise.franchisee.service.FranFranchiseService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranFranchiseRetrieveController {

	@Autowired
	FranFranchiseService service;

	@GetMapping("franFranchiseList.do")
	public String franRetrieveFranchiseList(@RequestParam(required = false ,defaultValue = "1") int page
												, SimpleCondition simpleCondition
												, Model model
												, Authentication authentication
	) {
		PaginationInfo paging = new PaginationInfo(7,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		HashMap<String, Object> inputData = new HashMap<String, Object>();

		inputData.put("paging", paging);
		inputData.put("empId", realUser.getEmpId());

		String franchiseId = realUser.getFranchiseId();
		System.out.println(franchiseId);
		FranchiseDefaultVO myFranchiseInfo = service.retrieveMyFranchiseInfo(realUser.getFranchiseId());
		model.addAttribute("myInfo",myFranchiseInfo);

		List<FranchiseDefaultVO> franchiseList = service.retrieveFranFranchiseList(inputData);
		model.addAttribute("ffcList",franchiseList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "franchisee:/franchisee/franFranchiseList";
	}

	@GetMapping("/franKakao.do")
	@ResponseBody
	public List<FranchiseDefaultVO> franRetrieveFranchiseListForKakao(Model model
												, Authentication authentication) {

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		HashMap<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("empId", realUser.getEmpId());

		List<FranchiseDefaultVO> fkList = service.retrieveKakaoFranchiseList(inputData);
		return fkList;


	}
}
