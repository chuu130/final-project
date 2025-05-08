package kr.or.ddit.franchise.staff.controller;

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
import kr.or.ddit.franchise.staff.service.StaffFranInvService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Controller
@RequestMapping("/main/staff")
public class StaffFranInvRetrieveController {

	@Autowired
	StaffFranInvService service;

	@GetMapping("staffFranInvList.do")
	public String staffRetrieveFranInvList(@RequestParam(required = false ,defaultValue = "1") int page
												, SimpleCondition simpleCondition
												, Model model
												, Authentication authentication
	) {
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		HashMap<String, Object> inputData = new HashMap<String, Object>();

		inputData.put("paging", paging);
		inputData.put("franchiseId", realUser.getFranchiseId());

		List<InventoryDefaultVO> sfiList = service.retrieveStaffFranInvList(inputData);
		model.addAttribute("sfiList",sfiList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "staff:/staff/staffFranInvList";
	}
}
