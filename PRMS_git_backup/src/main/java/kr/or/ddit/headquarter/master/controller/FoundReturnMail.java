package kr.or.ddit.headquarter.master.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import kr.or.ddit.api.mail.service.MailService;
import kr.or.ddit.vo.FoundEmailVO;

@Controller
public class FoundReturnMail {

	@Autowired
	MailService service;

	@PostMapping("/foundReturnMail.do")
	public void foundReturnMailProcess(@RequestBody FoundEmailVO femail) {
		String foundEmail = femail.getFoundEmail();
		String foundReCn = femail.getFoundReCn();
		service.sendFoundReturnMail(foundEmail, foundReCn);
	}
}
