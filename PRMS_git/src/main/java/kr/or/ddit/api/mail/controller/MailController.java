package kr.or.ddit.api.mail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.api.mail.service.MailService;

@Controller
public class MailController {

	@Autowired
	MailService service;

	@GetMapping("/mail.do")
	public String mailUI() {
		return "market:mail/mail";
	}


	@PostMapping("/mailProcess.do")
	public String mailProcess(
			@RequestParam String mail
			,RedirectAttributes redirectAttributes
	) {

		try {
			service.sendPwMail(mail);
			redirectAttributes.addFlashAttribute("msg","메일전송 성공!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("msg","메일 전송실패!");
		}

		String lvn = "redirect:/index.do";

		return lvn;
	}


}
