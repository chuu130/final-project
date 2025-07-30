package kr.or.ddit.franchise.staff.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.staff.service.StaffEmergencyService;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Controller
@RequestMapping("/main/staff")
public class StaffEmergencyInsertController {

	@Autowired
	StaffEmergencyService service;

	@PostMapping("staffInsertEmer.do")
	public void staffInsertEmergency(@RequestBody EmergencyDefaultVO emergnecy){
		service.createStaffEmer(emergnecy);
	}
}
