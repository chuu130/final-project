package kr.or.ddit.market.nonmember.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.ddit.market.nonmember.service.MarketLoginService;
import kr.or.ddit.market.nonmember.service.MarketLoginServiceImpl;
import kr.or.ddit.security.auth.service.MemberDetailServiceImpl;
import kr.or.ddit.vo.def.MemberDefaultVO;

@Controller
@RequestMapping("/market/login")
public class MarketLoginController {

	private String successURL;

	@GetMapping
	public String marketLoginUI() {
		return "market:/market/marketLogin";
	}

	@GetMapping("success")
	public String memberLoginSuccessProcess(Authentication authentication) {
		successURL = "redirect:/market/marketpage.do";
		return successURL;
	}

}
