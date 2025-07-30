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
import kr.or.ddit.headquarter.master.service.CenterBoardService;
import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.validate.groups.DeleteGroup;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.def.CenterDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.NoticeDefaultVO;
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
		
		// 답변상태 리스트표시
		List<QnaanswerDefaultVO> qnaList = qnaService.retrieveAllQnaBoard();
		model.addAttribute("qnaList", qnaList);
		
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
		
		// 해당 게시물에 대한 답변리스트를 불러온다.
		List<QnaanswerDefaultVO> qnaviewList = qnaService.retrieveQnaBoardList(ctrBbsNo);
		model.addAttribute("qnaviewList", qnaviewList);
		
		return "master:/center/centerMasterquestionDetail";
	}
	
	
	
	/**
	 * 게시물 답변 폼
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
	
	

	// 관리자 답변등록
	@PostMapping("/masterAnswerInsert")
	public String insertData(
			@Validated(InsertGroup.class) 
			 QnaanswerDefaultVO qnaBoard // 문의에대한 답변을 담을수있는 vo
			,BindingResult errors
			,RedirectAttributes redirectAttributes
			,Authentication authentication
	){
		String lvn = null;
		if(!errors.hasErrors()) {
			EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			qnaBoard.setEmpNo(realUser.getEmpNo()); // 직원번호
			qnaService.registerQnaBoard(qnaBoard);
			redirectAttributes.addAttribute("ctrBbsNo", qnaBoard.getCtrBbsNo());
			lvn = "redirect:/main/master/{ctrBbsNo}/quest";
		}else {
			redirectAttributes.addFlashAttribute("qnaBoard", qnaBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"qnaBoard", errors);
			
			redirectAttributes.addAttribute("ctrBbsNo", qnaBoard.getCtrBbsNo());
			lvn = "redirect:/main/master/{ctrBbsNo}/quest";
		}
		return lvn;
		
	}
	
	
	/**
	 * 게시물 답변수정 폼
	 * @param qnaAnswerId
	 * @param model
	 * @return
	 */
	@GetMapping("/centerMasterUpdate/{ctrBbsNo}/{qnaAnswerId}")
	public String updateform(@PathVariable String ctrBbsNo
					   ,@PathVariable String qnaAnswerId
					   ,Model model) {
		// 1. 답변정보 가져오기
		QnaanswerDefaultVO answer = qnaService.retrieveByqnaId(qnaAnswerId);
		model.addAttribute("answer", answer);
		
		// 2.문의 글 정보 가져오기
		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center", center);
		
		return "master:/center/centerMasterUpdate";
	}
	
	

	// 관리자 답변수정
	@PostMapping("/masterAnswerUpdate")
	public String UpdateData(
			@RequestParam("ctrBbsNo") String ctrBbsNo,
			@Validated(UpdateGroup.class) 
			 QnaanswerDefaultVO qnaBoard
			,BindingResult errors
			,RedirectAttributes redirectAttributes
			,Authentication authentication
	){
		String lvn = null;
		if(!errors.hasErrors()) {
			EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			qnaBoard.setEmpNo(realUser.getEmpNo()); // 직원번호
			qnaBoard.setCtrBbsNo(ctrBbsNo);
			qnaService.modifyQnaBoard(qnaBoard);
			redirectAttributes.addAttribute("ctrBbsNo", qnaBoard.getCtrBbsNo());
			lvn = "redirect:/main/master/{ctrBbsNo}/quest";
		}else {
			redirectAttributes.addFlashAttribute("qnaBoard", qnaBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"qnaBoard", errors);
			
			redirectAttributes.addAttribute("ctrBbsNo", qnaBoard.getCtrBbsNo());
			lvn = "redirect:/main/master/{ctrBbsNo}/quest";
		}
		return lvn;
		
	}

	
	@PostMapping("/centerMasterDelete/{qnaAnswerId}")
	public String delete( @PathVariable String qnaAnswerId
						, @RequestParam String ctrBbsNo
						, RedirectAttributes redirectAttributes
		){
			qnaService.removeQnaBoard(qnaAnswerId);
			log.info("qnaAnswerId 전달된값 {}", qnaAnswerId);
			redirectAttributes.addAttribute("ctrBbsNo", ctrBbsNo);
		return "redirect:/main/master/{ctrBbsNo}/quest";
		
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
