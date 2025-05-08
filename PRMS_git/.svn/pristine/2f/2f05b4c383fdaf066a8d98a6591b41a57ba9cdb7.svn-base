package kr.or.ddit.market.nonmember.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.market.nonmember.service.MarketLoginService;
import kr.or.ddit.vo.MemberIdFindingVO;
import kr.or.ddit.vo.MemberPwFindingVO;

/**
 * 마켓 회원정보를 찾는 컨트롤러
 * @author jbk
 *
 */
@Controller
@RequestMapping("/market/memberFinding")
public class MarketMemberFinding {

	@Autowired
	MarketLoginService marketLoginService;

	/**
	 * 회원 이름과 전화번호를 통해 아이디정보를 찾는 메소드
	 * @param memberIDFindingVO
	 * @param model
	 */
	@PostMapping(value = "id", produces = MediaType.APPLICATION_JSON_VALUE)
	public void idFindingProcess(
			@RequestBody MemberIdFindingVO memberIDFindingVO
			,Model model
	) {
		String msg = marketLoginService.findMemberId(memberIDFindingVO);
		model.addAttribute("msg", msg);
	}

	/**
	 * 회원 아이디와 이메일정보를 통해, 신규 비밀번호를 입력받은 이메일에 전송하는 메소드
	 * @param memberPwFindingVO
	 * @param model
	 */
	@PostMapping(value = "pw", produces = MediaType.APPLICATION_JSON_VALUE)
	public void pwFindingProcess(
			@RequestBody MemberPwFindingVO memberPwFindingVO
			,Model model
	) {
		String msg = marketLoginService.changeMemberPw(memberPwFindingVO);
		model.addAttribute("msg",msg);
	}

}
