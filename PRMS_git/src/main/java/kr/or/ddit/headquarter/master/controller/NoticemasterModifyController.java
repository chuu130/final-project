package kr.or.ddit.headquarter.master.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.NoticeService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/master")
public class NoticemasterModifyController {
	
	@Autowired
	NoticeService service;
	
	@Autowired
	AtchFileService atchService;
	
	
	@GetMapping("{noticeBbsNo}/updateUI")
	public String formUI(Model model
						,@PathVariable String noticeBbsNo) {
		NoticeDefaultVO notice = service.retrieveByNoticeNo(noticeBbsNo);
		model.addAttribute("notice",notice);
		return "master:/notice/noticeEdit";
	}
	
	
	@PostMapping("{noticeBbsNo}/updateform")
	public String modify(NoticeDefaultVO noticeBoard
						, BindingResult errors
						, Authentication authentication
	){
		String lvn = null;
		if(!errors.hasErrors()) {
     	    EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			noticeBoard.setEmpNo(realUser.getEmpNo());
			service.modifyNotice(noticeBoard);
	
			noticeBoard.setNoticeBbsAtch(null); 
			
		}
		return "redirect:/main/master/noticeList";
	}
	
	@PostMapping("{noticeBbsNo}/deleteNotice")
	public String delete(@PathVariable String noticeBbsNo
						, RedirectAttributes redirectAttributes){
		 	service.removeNotice(noticeBbsNo);
		 
		return "redirect:/main/master/noticeList";
		 
	 }
}