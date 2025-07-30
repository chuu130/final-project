package kr.or.ddit.franchise.franchisee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.franchise.franchisee.service.FranInvReqService;

@Controller
@RequestMapping("/main/franchisee")
public class FranInvReqUpdateController {

	@Autowired
	FranInvReqService service;

	@GetMapping("franInvReqUpdate.do")
	@Transactional
	public String franInvReqUpdate(@RequestParam("fireqId") String fireqId
									, @RequestParam("fireqSttus") String fireqSttus
									, @RequestParam("searchWord") String searchWord
									, @RequestParam(value =  "page" , required = false) int page
	) {

		service.modifyInvReq(fireqId, fireqSttus);
		service.createMyHeadInvReqReturnSell(fireqId);
		service.createAdminHeadInvReqReturnExp(fireqId);

		return "redirect:/main/franchisee/franInvReqList.do?searchType=search&searchWord="+searchWord+"&page="+page;
	}


}
