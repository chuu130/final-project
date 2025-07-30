package kr.or.ddit.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.main.service.EmployeeLoginService;
import kr.or.ddit.vo.EmployeeIdFindingVO;
import kr.or.ddit.vo.EmployeePwFindingVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 임직원 정보를 찾는 컨트롤러
 * @author jbk
 *
 */
@Slf4j
@Controller
@RequestMapping("/mainEmpFinding")
public class MainEmpFindingController {

	@Autowired
	private EmployeeLoginService employeeService;

	/**
	 * 임직원 이름과 전화번호를 통해, 아이디정보를 찾는 메소드
	 * @param employeeIdFindingVO
	 * @param model
	 */
	@PostMapping(value =  "id", produces = MediaType.APPLICATION_JSON_VALUE)
	public void idFindingProcess(
			@RequestBody EmployeeIdFindingVO employeeIdFindingVO
			,Model model
	) {
		String msg = employeeService.findEmployeeId(employeeIdFindingVO);
		model.addAttribute("msg", msg);
	}

	/**
	 * 임직원 아이디와 이메일 정보를 통해, 신규 비밀번호를 입력받는 이메일에 전송하는 메소드
	 * @param employeePwFindingVO
	 * @param model
	 */
	@PostMapping(value = "pw", produces = MediaType.APPLICATION_JSON_VALUE)
	public void pwChangeProcess(
			@RequestBody EmployeePwFindingVO employeePwFindingVO
			,Model model
	) {
		String msg = employeeService.changeEmployeePw(employeePwFindingVO);
		model.addAttribute("msg", msg);
	}

}
