package kr.or.ddit.headquarter.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.headquarter.common.service.FranauditService;
import kr.or.ddit.vo.CheckListVO;
import kr.or.ddit.vo.FranAuditVO;
import kr.or.ddit.vo.FranchiseVO;
import kr.or.ddit.vo.SetlDtVO;
import kr.or.ddit.vo.def.FranauditDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FranauditController {

	@Autowired
	private FranauditService service;
	
	
	@GetMapping("franAuditList")
	public String franAuditList(@RequestParam(value= "date", required=false) String date
			,Model model) {
		
		List<FranAuditVO> auditList = service.selectAuditList(date);
		
		model.addAttribute("auditList", auditList);
		model.addAttribute("hash", "franAuditList");
		
		return "master:master/franAuditList";
	}
	
	@PostMapping("franPostAuditList")
	@ResponseBody
	public List<FranAuditVO> franPostAuditList(@RequestParam(value= "date", required=false) String date
			,Model model) {
		date = date.substring(0, 7);
		List<FranAuditVO> franAuditList = service.selectAuditList(date);
		
		model.addAttribute("franAuditList", franAuditList);
		
		return franAuditList;
		
	}
	
	@GetMapping("franchiseAuditList")
	public String franchiseAuditList(@RequestParam(value= "date", required=false) String date
			,Model model) {
		
		List<FranchiseVO> franchiseAuditList = service.selectFranchiseAuditList(date);
		
		model.addAttribute("franchiseAuditList", franchiseAuditList);
		model.addAttribute("hash", "franchiseAuditList");
		
		return "master:master/franchiseAuditList";
	}
	
	@PostMapping("franchisePostAuditList")
	@ResponseBody
	public List<FranchiseVO> franchisePosAuditList(@RequestParam(value= "date", required=false) String date
			,Model model) {
		date = date.substring(0, 7);
		List<FranchiseVO> franchiseAuditList = service.selectFranchiseAuditList(date);
		
		model.addAttribute("franchiseAuditList", franchiseAuditList);
		
		return franchiseAuditList;
		
	}
	
	
//	@GetMapping("franAduitCheckList")
//	public String franAduitCheckList(@RequestParam(value= "franId", required=false) String franId
//			,@RequestParam(value= "franDe", required=false) String franDe
//			,Model model) {
//		
//		CheckListVO checkList = service.selectFranAuditCheckList(franId, franDe);
//		
//		model.addAttribute("checkList", checkList);
//		
//		
//		return "master:master/franAduitCheckList";
//	}
	
	@PostMapping("franAduitCheckList")
	@ResponseBody
	public CheckListVO franAduitCheckList(@RequestParam(value= "franId", required=false) String franId
			,@RequestParam(value= "franDe", required=false) String franDe
			,Model model) {
		
		CheckListVO checkList = service.selectFranAuditCheckList(franId, franDe);
		
		model.addAttribute("checkList", checkList);
		
		
		return checkList;
	}
	
	@GetMapping("writeFranAuditCheckList")
	public String writeFranAuditCheckList(@RequestParam(value= "franId", required=false) String franId
			,@RequestParam(value= "franDe", required=false) String franDe
			,Model model) {
		
		CheckListVO checkList = service.selectFranAuditCheckList(franId, franDe);
		if(checkList == null) {
			service.insertCheckListNo();
			service.updateAuditCheckNo(franId, franDe);
			checkList = service.selectFranAuditCheckList(franId, franDe);
			
		}
		
		model.addAttribute("checkList", checkList);
		
		return "master:master/writeFranAuditCheckList";
	}
	
	@PostMapping("saveFranAuditCheckList")
	@ResponseBody
	public void saveFranAuditCheckList(@RequestParam(value="checkNo", required = false) String checkNo
			,@RequestParam(value="confirm", required = false) String confirm
			,@RequestParam(value="r1", required = false)int r1
			,@RequestParam(value="r2", required = false)int r2
			,@RequestParam(value="r3", required = false)int r3
			,@RequestParam(value="r4", required = false)int r4
			,@RequestParam(value="r5", required = false)int r5
			,@RequestParam(value="r6", required = false)int r6
			,@RequestParam(value="r7", required = false)int r7
			,@RequestParam(value="audit", required = false) String audit
			,@RequestParam(value="text", required = false) String text) {
		
		service.updateFranAudit(text, audit, confirm, checkNo);
		service.updateCheckList(r1, r2, r3, r4, r5, r6, r7, checkNo);
		
	}
}
