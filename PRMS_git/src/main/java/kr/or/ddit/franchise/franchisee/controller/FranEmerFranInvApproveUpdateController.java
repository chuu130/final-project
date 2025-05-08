package kr.or.ddit.franchise.franchisee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.franchise.franchisee.service.FranEmerApproveService;
import kr.or.ddit.vo.def.EmergencyDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranEmerFranInvApproveUpdateController {

	@Autowired
	FranEmerApproveService service;

	@GetMapping("franUpdateEmerFranInvApproveSuccess.do")
	@Transactional
	public String franUpdateEmerFranInvApproveSuccess(@RequestParam("emerNo") String emerNo
												, @RequestParam("emerPartn") String emerPartn
												, @RequestParam("searchWord") String searchWord
												, @RequestParam(value =  "page" , required = false) int page
	) {

		service.modifyEmerApprove(emerNo, emerPartn);
		service.modifyMyFranEmerApproveInv(emerNo);
		service.modifyOtherFranEmerApporveInv(emerNo);

		return "redirect:/main/franchisee/franRetrieveEmerFranInvApproveList.do?searchType=search&searchWord="+searchWord+"&page="+page;
	}

	@GetMapping("franUpdateEmerFranInvApproveReturn.do")
	@Transactional
	public String franUpdateEmerFranInvApproveReturn(@RequestParam("emerNo") String emerNo
												, @RequestParam("emerPartn") String emerPartn
												, @RequestParam("searchWord") String searchWord
												, @RequestParam(value =  "page" , required = false) int page
	) {
		service.modifyEmerApprove(emerNo, emerPartn);
		service.createMyFranEmerApproveExp(emerNo);
		service.createOtherFranEmerApproveSell(emerNo);
		return "redirect:/main/franchisee/franRetrieveEmerFranInvApproveList.do?searchType=search&searchWord="+searchWord+"&page="+page;
	}

	@PostMapping("franUpdateEmerFranInvStatus.do")
	public void franUpdateEmerFranInvStatus(@RequestBody EmergencyDefaultVO emer) {
		service.modifyEmerFranInvStatus(emer);
	}

	@GetMapping("approveYourEmpId.do")
	@ResponseBody
	public String approveYourEmpId(String emerNo) {
		return service.retrieveApproveYourEmpId(emerNo);
	}

}
