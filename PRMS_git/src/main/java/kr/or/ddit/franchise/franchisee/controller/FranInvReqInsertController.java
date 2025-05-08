package kr.or.ddit.franchise.franchisee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.franchisee.service.FranInvReqService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.InvrequestDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranInvReqInsertController {

	@Autowired
	FranInvReqService service;

	@PostMapping("/franInsertInvReq.do")
	@Transactional
	public void franInsertInvReq(@RequestBody InvrequestDefaultVO invReq, Authentication authentication) {
		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		String empId = realUser.getEmpId();
		service.createFranInvReq(invReq, empId);
		service.createFranApplyInvReqExp(invReq);
		service.createAdminApplyInvReqSell(invReq);
	}

}
