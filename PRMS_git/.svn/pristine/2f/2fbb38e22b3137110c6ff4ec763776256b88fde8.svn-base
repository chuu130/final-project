package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import kr.or.ddit.headquarter.master.service.CenterBoardService;
import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.vo.def.CenterDefaultVO;
import kr.or.ddit.vo.def.QnaanswerDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * centerqna 다 안쓰고 이거로씀
 * @author PC-12
 *
 */
@Slf4j
@Controller
@RequestMapping("/main/master")
public class CenterMasterController {
	
	@Autowired
	private CenterBoardService service;
	
	@Autowired
	private QnaService qnaService;
	
	@GetMapping("/centerMasterList")
	public String formUI(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
	){
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<CenterDefaultVO> centerList = service.retrieveAllCenterBoard(paging);
		model.addAttribute("centerList", centerList);
		
		// 페이지 랜더링
		PaginationRenderer renderer = new ThemeType2PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "master:/center/centerMasterList";
		
	}
	

	/** 게시물 상세조회
	 * @param ctrBbsNo
	 * @param model
	 * @return
	 */
	@GetMapping("/{ctrBbsNo}/quest")
	public String detail(@PathVariable String ctrBbsNo
			            , QnaanswerDefaultVO qnaBoard
						, Model model) {
		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center", center);
		
		List<QnaanswerDefaultVO> qnaviewList = qnaService.retrieveQnaBoardList(ctrBbsNo);
		model.addAttribute("qnaviewList", qnaviewList);
		
		return "master:/center/centerMasterquestionDetail";
	}
	
	
	
	/**
	 * 게시물 상세조회 답변 폼
	 * @param ctrBbsNo
	 * @param model
	 * @return
	 */
	@GetMapping("/centerMasterInsert/{ctrBbsNo}")
	public String form(@PathVariable String ctrBbsNo
					   ,Model model) {
		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center", center);
		return "master:/center/centerMasterInsert";
	}
	
	

	@PostMapping("/centerMaster")
	public String insertData(
			 QnaanswerDefaultVO qnaBoard
			,BindingResult errors
			,RedirectAttributes redirectAttributes
			,Authentication authentication
	) {
		String lvn = null;
		if(!errors.hasErrors()) {
			qnaService.registerQnaBoard(qnaBoard);
			lvn = "redirect:/main/master/centerMasterList";
		}else {
			redirectAttributes.addFlashAttribute("qnaBoard", qnaBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"qnaBoard", errors);
			lvn = "redirect:/main/masterr/centerMasterList";
		}
		return lvn;
		
	}
	
	
//	@GetMapping("/centerboardList")
//	public String formUI(Model model) {
//		List<CenterDefaultVO> centerList = service.retrieveAllCenterBoard();
//		model.addAttribute("centerList", centerList);
//		
//		return "master:center/centerMasterList";
//		
//	}
//	
//	
//	@GetMapping("/center/{ctrBbsNo}")
//	public String detail(@PathVariable String ctrBbsNo
//			, Model model) {
//		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
//		model.addAttribute("center", center);
//		return "master:/center/centerMasterDetail";
//	}

}
