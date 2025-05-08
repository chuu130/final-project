package kr.or.ddit.franchise.franchisee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.franchise.franchisee.service.FranEmergencyService;

@Controller
@RequestMapping("/main/franchisee")
public class FranEmerFranInvApplyUpdateController {

	@Autowired
	FranEmergencyService service;

	@GetMapping("franEmerFranApplyUpdate.do")
	@Transactional
	public String franEmerFranApplyUpdate(@RequestParam("emerNo") String emerNo
									, @RequestParam("emerPartn") String emerPartn
									, @RequestParam("searchWord") String searchWord
									, @RequestParam(value =  "page" , required = false) int page
	) {

		service.modifyEmerApply(emerNo, emerPartn);
		service.createMyFranEmerApplyReturnSell(emerNo);
		service.createOtherFranEmerApplyReturnExp(emerNo);

		return "redirect:/main/franchisee/franEmerFranInvApplyList.do?searchType=search&searchWord="+searchWord+"&page="+page;
	}


}
