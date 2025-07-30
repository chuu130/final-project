package kr.or.ddit.franchise.staff.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.staff.service.StaffService;
import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class StaffController {

	@Autowired
	private StaffService service;
	@Autowired
	private EmployeeService empservice;

	@GetMapping("/quitstaffList")
	public String quitstaffList(Model model) {
		List<EmployeeDefaultVO> list = service.selectQuitStaffList();
		for(EmployeeDefaultVO empVO : list) {
			if(empVO.getEmpLeaveAt().equals("Y")) {
				empVO.setEmpLeaveAt("퇴사");
			}else {
				empVO.setEmpLeaveAt("재직");
			}

			if(empVO.getEmpLicenseAt().equals("Y")) {
				empVO.setEmpLicenseAt("자격O");
			}else {
				empVO.setEmpLicenseAt("자격X");
			}
		}
		model.addAttribute("QuitStaffList", list);
		return "franchisee:staff/quitstaffList";
	}

	@GetMapping("/staffList")
	public String staffList(Model model) {
		List<EmployeeDefaultVO> list = service.selectStaffList();
		for(EmployeeDefaultVO empVO : list) {
			if(empVO.getEmpLeaveAt().equals("Y")) {
				empVO.setEmpLeaveAt("퇴사");
			}else {
				empVO.setEmpLeaveAt("재직");
			}

			if(empVO.getEmpLicenseAt().equals("Y")) {
				empVO.setEmpLicenseAt("자격O");
			}else {
				empVO.setEmpLicenseAt("자격X");
			}
		}
		model.addAttribute("staffList", list);
		return "franchisee:staff/staffList";
	}


	@GetMapping("/{empNo}/detail")
	public String staffDetail(@PathVariable String empNo, Model model) {
		EmployeeDefaultVO empVO = service.selectStaff(empNo);
		model.addAttribute("empVO", empVO);
		return "franchisee:staff/staffDetail";
	}

	@GetMapping("/employeeinsertUI")
	public String employeeinsertUI() {
		return "franchisee:staff/employeeinsertUI";
	}

	@PostMapping("{empId}/employeeinsert")
	public String employeeinsert(EmployeeDefaultVO empVO, @PathVariable String empId) {
		EmployeeDefaultVO emppvo = empservice.selectEmployeeFranId(empId);
		empVO.setEmpCl("COMN06DT004");
		empVO.setHqId("HEAD1");
		empVO.setFranchiseId(emppvo.getFranchiseId());

		System.out.println("====================================================================="+emppvo.getFranchiseId());

		empservice.insertEmployee(empVO);

		return "redirect:/main/franchisee/staffList";
	}

	@PostMapping("/staffUpdate")
	public String staffUpdate(EmployeeDefaultVO empVO, Model model) {
		service.updateStaff(empVO);
		return "redirect:/main/franchisee/staffList";
	}

	@PostMapping("/staffDelete")
	public String staffDelete(String empNo, Model model) {
		service.deleteStaff(empNo);
		return "redirect:/main/franchisee/staffList";
	}
}
