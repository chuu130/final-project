package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.headquarter.master.mapper.FoundEmployeeMapper;
import kr.or.ddit.headquarter.master.service.FoundApproveService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FoundApporveRetrieveController {

	@Autowired
	FoundApproveService service;

	@Autowired
	FoundEmployeeMapper mapper;

	@GetMapping("foundApproveList.do")
	public String foundApporveList(@RequestParam(required = false ,defaultValue = "1") int page
										, SimpleCondition simpleCondition
										, Model model) {
		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<FoundDefaultVO> foundApproveList = service.retrieveFoundApproveList(paging);
		model.addAttribute("faList", foundApproveList);

		List<EmployeeDefaultVO> employeeList = mapper.selectFoundEmployeeList();
		model.addAttribute("emList", employeeList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "master:/master/foundApproveList";
	}
}
