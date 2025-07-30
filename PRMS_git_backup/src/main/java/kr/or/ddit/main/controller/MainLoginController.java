package kr.or.ddit.main.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 로그인을 처리하는 컨트롤러
 * @author jbk
 *
 */
@Controller
@RequestMapping("/main/login")
public class MainLoginController {

	private String successURL;
	
	@Autowired
	private FranchiseInfoService franInfoService;

	/**
	 * 로그인 화면으로 이동하는 메소드
	 * @return
	 */
	@GetMapping
	public String mainLoginUI() {
		return "/main/mainLogin";
	}

	/**
	 * 임직원 로그인 성공시, 권한에 맞는 페이지로 이동하는 메소드
	 * @param authentication
	 * @return
	 */
	@GetMapping("success")
	public String mainLoginSuccessProcess(Authentication authentication
			,RedirectAttributes redirectAttributes) {

		successURL = "redirect:/main/";

		// 1. 로그인 성공한, 스프링 인증객체를 가져온다.
		// 2. 권한에 따라 해당 페이지로 이동한다.
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		authorities.forEach(a -> {
				if(a.toString().equals("MASTER")) {
					successURL += "master/masterpage.do#masterpage";
				}
				else if(a.toString().equals("EMPLOYEE")) {
					successURL += "employee/employeepage.do";
				}
				else if(a.toString().equals("FRANCHISEE")) {
					SecurityContext sc = SecurityContextHolder.getContext();
					 EmployeeDefaultVOWrapper franWrapper  = (EmployeeDefaultVOWrapper) sc.getAuthentication().getPrincipal();
					 EmployeeDefaultVO fran = franWrapper.getRealUser();
					 
					 String franchiseId = fran.getFranchiseId();
					 
					 FranchiseDefaultVO franchise = franInfoService.retrieveFranchiseDetail(franchiseId);
					 String franNm = franchise.getFranchiseNm();
					 redirectAttributes.addFlashAttribute("franNm", franNm);
					successURL += "franchisee/franchiseepage.do#franchisepage";
				}
				else if(a.toString().equals("STAFF")) {
					successURL += "staff/staffpage.do";
				}
		});




		return successURL;
	}


	/**
	 * 임직원 로그인 실패시, 임직원 로그인화면으로 이동하는 메소드
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("failure")
	public String mainLoginFailureProcess(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("msg","아이디나 비밀번호를 다시 확인해주세요.");
		return "redirect:/main/login";
	}

}
