package kr.or.ddit.headquarter.master.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FoundCheckUpdateController {

	@Autowired
	FoundService service;

	@GetMapping("foundCheckUpdate.do")
	public String foundCheckUpdate(@RequestParam("foundNo") String foundNo
									, @RequestParam("foundConfmAt") String foundConfmAt ) {

		service.modifyFound(foundNo, foundConfmAt);

		return "redirect:/main/master/foundCheckList.do";
	}

}
