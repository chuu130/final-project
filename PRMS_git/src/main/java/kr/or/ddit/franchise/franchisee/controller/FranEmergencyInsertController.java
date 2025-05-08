package kr.or.ddit.franchise.franchisee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.franchise.franchisee.service.FranEmergencyService;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranEmergencyInsertController {

	@Autowired
	FranEmergencyService service;

	@GetMapping("yourEmpId.do")
	@ResponseBody
	public String yourEmpIdInfo(String reqFranchiseId) {
		return service.retrieveYourEmpIdInfo(reqFranchiseId);
	}

	@PostMapping("franInsertEmer.do")
	@Transactional
	public void franInsertEmergency(@RequestBody EmergencyDefaultVO emergnecy) {
		service.createFranEmer(emergnecy);
		service.createMyFranEmerApplyExp(emergnecy);
		service.createOtherFranEmerApplySell(emergnecy);
	}
}
