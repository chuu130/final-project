package kr.or.ddit.market.nonmember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.market.nonmember.service.MarketJoinService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.def.MemberDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 회원가입을 처리하는 컨트롤러
 * @author jbk
 *
 */
@Slf4j
@Controller
@RequestMapping("/market/join")
public class MarketJoinController {

	@Autowired
	MarketJoinService marketJoinService;


	@ModelAttribute("member")
	public MemberDefaultVO member() {
		return new MemberDefaultVO();
	}

	/**
	 * 회원가입 UI로 이동하는 메소드
	 * @return
	 */
	@GetMapping
	public String marketJoinUI() {
		return "market:market/marketJoin";
	}

	/**
	 * 아이디 중복검사 메소드
	 * @param inputId
	 * @param model
	 */
	@PostMapping(value = "idChk", produces = MediaType.APPLICATION_JSON_VALUE)
	public void marketIdChkProcess(
			@RequestParam String inputId
			, Model model
	) {
		boolean chkStatus = marketJoinService.chkId(inputId);
		model.addAttribute("chkStatus" ,chkStatus);
	}


	/**
	 * 회원가입을 진행하는 메소드
	 * @param member
	 * @param errors
	 * @param redirectAttributes
	 * @return
	 */
	@PostMapping
	public String marketJoinProcess(
		@Validated(InsertGroup.class) @ModelAttribute(value = "member") MemberDefaultVO member
		,Errors errors
		,RedirectAttributes redirectAttributes
	) {
		String lvn = "";

		// 검증에 통과할 시
		if(!errors.hasErrors()) {
			log.info("{}",member); // 입력받은 값 체크

			// 신규회원을 추가한다.
			ServiceResult serviceResult = marketJoinService.createMember(member);

			// 회원정보가 추가되었다면
			if(serviceResult.equals(ServiceResult.OK)) {
				// 로그인 페이지로 이동한다.
				redirectAttributes.addFlashAttribute("msg", "회원가입 성공");
				lvn = "redirect:/market/login";
			} else {
				redirectAttributes.addFlashAttribute("msg", "아이디 중복");
				redirectAttributes.addFlashAttribute("member", member);
				String attrName = BindingResult.MODEL_KEY_PREFIX + "member";
				redirectAttributes.addFlashAttribute(attrName, errors);
				lvn = "redirect:/market/join";
			}

		} else {
			redirectAttributes.addFlashAttribute("member", member);
			String attrName = BindingResult.MODEL_KEY_PREFIX + "member";
			redirectAttributes.addFlashAttribute(attrName, errors);
			lvn = "redirect:/market/join";
		}

		return lvn;
	}

}
