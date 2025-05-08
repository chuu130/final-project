package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.franchise.franchisee.service.StoreManageService;
import kr.or.ddit.vo.def.StoremanageDefaultVO;

@Controller
@RequestMapping("/main/master")
public class StoreManageController {

	@Autowired
	private StoreManageService service;

	@GetMapping("/storemamage.do")
	public String StoreManageList(Model model) {
		List<StoremanageDefaultVO> list = service.StoremanageList();
		model.addAttribute("storelist", list);

		return "master:master/storelist";
	}
}
