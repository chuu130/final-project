package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.franchisee.service.FranchiseMemoRandumService;
import kr.or.ddit.franchise.franchisee.service.FranchiseService;
import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.headquarter.master.service.MasterMemorandumService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Controller
@RequestMapping("/main/franchise")
public class FranMemoRandumController {

	@Autowired
	private FranchiseMemoRandumService service;
	@Autowired
	private FranchiseService franservice;
	@Autowired
	private EmployeeService empservice;

	@GetMapping("{empId}/memorandum")
	public String memorandum(@PathVariable String empId, Model model) {

		EmployeeDefaultVO empVO = empservice.selectEmployeeFranId(empId);
		FranchiseDefaultVO franVO = franservice.selectFranchise(empVO.getFranchiseId());

		List<FranchiseDefaultVO> list = service.selectfranmemoList(franVO.getFranchiseId());

		model.addAttribute("FranMemoList", list);

		return "franchisee:franchisee/franmemoList";
	}
}
