package kr.or.ddit.market.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.headquarter.master.service.CenterBoardService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.CenterDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class CenterQNAMarketModifyController {
	
	@Autowired
	private CenterBoardService service;
	
	@GetMapping("{ctrBbsNo}/updateCenter")
	public String formUI(Model model
						,@PathVariable String ctrBbsNo) {
		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center",center);
		return "market:/center/centerMemberUpdate";
	}
	
	
	@PostMapping("{ctrBbsNo}/updateCenter")
	public String modify(@Validated(UpdateGroup.class) CenterDefaultVO centerBoard
						, BindingResult errors
						, RedirectAttributes redirectAttributes
						, Authentication authentication
	){
		String lvn = null;
		if(!errors.hasErrors()) {
			SecurityContext sc = SecurityContextHolder.getContext();
			MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
			String memNo = member.getRealUser().getMemNo();
			centerBoard.setMemNo(memNo);
			service.modifyCenterBoard(centerBoard);
			lvn = "redirect:/market/member/centerMarketList";
			
		}
		return lvn;
	}
	
	@PostMapping("{ctrBbsNo}/deleteCenter")
	public String delete(@PathVariable String ctrBbsNo
						, RedirectAttributes redirectAttributes){
		 	service.removeCenterBoard(ctrBbsNo);
		return "redirect:/market/member/centerMarketList";
		 
	 }

}
