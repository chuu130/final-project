package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.FoundOpenService;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FoundOpenController {

	@Autowired
	private FoundOpenService service;

	@GetMapping("/FoundOpen.do")
	public String FoundList(Model model) {
		List<FoundDefaultVO> list = service.selectFoundList();
		model.addAttribute("foundList", list);
		model.addAttribute("hash", "foundOpen");
		return "master:master/foundOpenList";
	}

}
