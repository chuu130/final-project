package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.MainTainService;
import kr.or.ddit.vo.def.MaintainDefaultVO;

@Controller
@RequestMapping("/main/master")
public class MainTainController {

	@Autowired
	private MainTainService service;

	@GetMapping("/maintainlist.do")
	public String maintainlist(Model model) {
		List<MaintainDefaultVO> list = service.selectAll();
		for(MaintainDefaultVO mainVO : list) {
			if(mainVO.getMaintAt().equals("Y")) {
				mainVO.setMaintAt("관리비 납부 완료");
			}else {
				mainVO.setMaintAt("관리비 미납");
			}
		}
		model.addAttribute("maintainlist", list );
		return  "master:master/maintainlist";
	}

	@GetMapping("{franchiseId}/memoinsertpage")
	public String insertpage(@PathVariable String franchiseId, Model model) {

		model.addAttribute("franchiseId", franchiseId);

		return "master:master/maintainmemoinsert";
	}

}
