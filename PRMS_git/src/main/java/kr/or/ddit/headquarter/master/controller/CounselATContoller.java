package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.ContractService;
import kr.or.ddit.headquarter.master.service.CounselService;
import kr.or.ddit.headquarter.master.service.SellingService;
import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.vo.def.ContractDefaultVO;
import kr.or.ddit.vo.def.CounselDefaultVO;
import kr.or.ddit.vo.def.FoundDefaultVO;
import kr.or.ddit.vo.def.SellingDefaultVO;

@Controller
@RequestMapping("/main/master")
public class CounselATContoller {

	@Autowired
	private CounselService service;
	@Autowired
	private ContractService contservice;
	@Autowired
	private SellingService selservice;
	@Autowired
	private FoundService foundservice;

	@GetMapping("/counselATList")
	public String AtList(Model model) {

		List<FoundDefaultVO> foundList = foundservice.foundAtList();
		for(FoundDefaultVO foundVO : foundList) {
			if(foundVO.getFoundSideSe().equals("Y")) {
				foundVO.setFoundSideSe("상담통과");
			}else {
				foundVO.setFoundSideSe("상담미통과");
			}
		}
		model.addAttribute("foundList", foundList);
		model.addAttribute("hash", "counselATList");

		return "master:master/counselAtList";
	}

	@GetMapping("/counselAtUpdate/{foundNo}")
	public String counselAtUpdate(@PathVariable String foundNo) {
		int focnt = foundservice.foundSideSeupdate(foundNo);
		if(focnt > 0) {
			FoundDefaultVO foundVO = foundservice.selectfound(foundNo);
			CounselDefaultVO counVO = new CounselDefaultVO();
			counVO.setCounselCn(foundVO.getFoundCn());
			counVO.setFoundNo(foundVO.getFoundNo());
			int cnt = service.insertCounsel(counVO);
			if(cnt > 0) {
				String counselNo = service.selectCounselMax();
				CounselDefaultVO counselVO = service.selectCounsel(counselNo);
				ContractDefaultVO conVO = new ContractDefaultVO();
				conVO.setContractPc(500000);
				conVO.setContractPcAt("Y");
				conVO.setCounselNo(counselNo);
				conVO.setFoundNo(counVO.getFoundNo());
				int cnt2 = contservice.insertContract(conVO);
				if(cnt2 > 0) {
					SellingDefaultVO selVO = new SellingDefaultVO();
					selVO.setHqId("HEAD1");
					selVO.setSelngSe("COMN17DT004");
					selVO.setSelngNm("가맹계약비");
					selVO.setSelngCn("가맹계약비");
					selVO.setSelngAmount("500000");
					selservice.insertSelling(selVO);

				}
			}

		}
		
		
		
		

		return "redirect:/main/master/counselATList";

	}

}
