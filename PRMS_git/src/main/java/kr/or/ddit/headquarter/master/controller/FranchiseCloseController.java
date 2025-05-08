package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.franchisee.service.FranchiseService;
import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FranchiseCloseController {

	@Autowired
	private FranchiseService service;
	@Autowired
	private EmployeeService empservice;

	@GetMapping("/franchiseeList")
	public String franchiseeList(Model model) {
		List<FranchiseDefaultVO> list = service.selectfranchiseclose();

		model.addAttribute("franchiseList", list);
		model.addAttribute("hash", "franchiseeList");

		return "master:master/franchiseCloseList";
	}

	@GetMapping("/{franchiseId}/franchiseClose")
	public String franchiseClose(@PathVariable String franchiseId) {
		System.out.println("========================================================"+franchiseId);
		// 가맹점 폐업 처리
		int cnt = service.franchiseClose(franchiseId);

		if(cnt > 0) {
			// 가맹점 폐업 후 해당 가맹점 직원들 전체 퇴사 처리
			List<FranchiseDefaultVO> list = service.selectFranchiseEmployees(franchiseId);
			for(FranchiseDefaultVO franvo : list) {
				for(EmployeeDefaultVO empvo : franvo.getEmployeeList()) {
					empservice.updateLeaveYn(empvo.getEmpNo());
				}
			}
		}

		return "redirect:/main/master/franchiseeList";
	}
}
