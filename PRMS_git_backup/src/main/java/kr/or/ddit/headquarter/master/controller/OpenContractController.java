package kr.or.ddit.headquarter.master.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main/master")
public class OpenContractController {

	@GetMapping("/openContract")
	public String openContractUI() {

		return "master:master/openContract";
	}
}
