package kr.or.ddit.headquarter.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.common.service.AdminRefundService;
import kr.or.ddit.vo.AdminRefundVO;

@Controller
@RequestMapping("/main/master")
public class AdminRefundController {
	
	@Autowired
	private AdminRefundService service;

	@GetMapping("refundList")
	public String adminRefundList(Model model) {
		
		List<AdminRefundVO> refundList = service.selectRefundList();
		
		model.addAttribute("refundList", refundList);
		
		return "master:master/adminRefundList";
	}
}
