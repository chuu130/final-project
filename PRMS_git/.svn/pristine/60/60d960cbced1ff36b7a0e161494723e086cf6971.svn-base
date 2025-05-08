package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.BlackListservice;
import kr.or.ddit.vo.def.BlacklistDefaultVO;

@Controller
@RequestMapping("/main/master")
public class BlackListController {
	@Autowired
	private BlackListservice service;

	@GetMapping("blackList.do")
	public String BlackListAll(Model model) {
		List<BlacklistDefaultVO> list = service.selectAll();
		for(BlacklistDefaultVO vo: list) {
			vo.toString();
		}
		model.addAttribute("BlackList",list);
		return "master:/master/blackList";

	}

}
