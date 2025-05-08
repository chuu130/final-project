package kr.or.ddit.headquarter.master.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.headquarter.master.service.FoundApproveService;

@Controller
@RequestMapping("/main/master")
public class FoundApproveUpdateControll {

	@Autowired
	FoundApproveService service;

	@GetMapping("foundApproveUpdate.do")
	public String foundApproveUpdate(@RequestParam("empNo") String empNo
			, @RequestParam("foundDe") String foundDe, @RequestParam("foundNo") String foundNo){

		service.modifyApproveFound(foundNo, empNo, foundDe);

		return "redirect:/main/master/foundApproveList.do";
	}
}
