package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.NoticeService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/master")
public class NoticemasterController {

	@Autowired
	private NoticeService service;

	@Autowired
	private AtchFileService atchFileService;


	@GetMapping("/noticeList")
	public String list(
			@RequestParam(required = false, defaultValue = "1") int page
			, Model model
			, @ModelAttribute("condition") SimpleCondition simpleCondition
	){
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		List<NoticeDefaultVO> noticeList = service.retrieveAllNotice(paging);
		model.addAttribute("noticeList", noticeList);

		// 페이지 랜더링
		PaginationRenderer renderer = new ThemeType2PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);

		return "master:/notice/noticeList";

	}

	@GetMapping("/noticeInsertUI")
	public String insertUI(Model model) {
		return "master:/notice/noticeInsert";
	}

	@PostMapping("/noticeInsertData")
	public String insertData(
			@Validated(InsertGroup.class)
			 NoticeDefaultVO noticeBoard
			,BindingResult errors
			,RedirectAttributes redirectAttributes
			,Authentication authentication
	) {
		String lvn = null;
		if(!errors.hasErrors()) {
			EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			noticeBoard.setEmpNo(realUser.getEmpNo());
			service.registerNotice(noticeBoard);

			lvn = "redirect:/main/master/noticeList";
		}else {
			redirectAttributes.addFlashAttribute("noticeBoard", noticeBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"noticeBoard", errors);
			lvn = "redirect:/main/master/noticeList";
		}
		noticeBoard.setNoticeBbsAtch(null);
		return lvn;
 
	}

	@GetMapping("/notice/{noticeBbsNo}")
	public String detail(@PathVariable String noticeBbsNo
						, Model model) {
		service.incrementHitNO(noticeBbsNo); // 조회수 증가 설정
		NoticeDefaultVO notice = service.retrieveByNoticeNo(noticeBbsNo);
		
		
		Integer atchFileId = notice.getNoticeBbsAtch(); 
		if(atchFileId != null) {
			AtchfileVO atchvo = atchFileService.readAtchFileEnable(atchFileId, null);
			notice.setAtchFile(atchvo);
			model.addAttribute("notice", notice);
		}
		model.addAttribute("notice", notice);
		return "master:/notice/noticeDetail";
	}


}
