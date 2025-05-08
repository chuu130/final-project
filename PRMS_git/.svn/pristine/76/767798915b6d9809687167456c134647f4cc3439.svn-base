package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.PartnersService;
import kr.or.ddit.vo.def.PartnersDefaultVO;

@Controller
@RequestMapping("main/master")
public class PartnersController {
	@Autowired
	private PartnersService service;

	@GetMapping("PartnerList.do")
	public String PartnerList(Model model) {
		List<PartnersDefaultVO> list = service.selectAll();
		model.addAttribute("PartnerList", list);
		return "master:master/PartnerList";
	}

}
