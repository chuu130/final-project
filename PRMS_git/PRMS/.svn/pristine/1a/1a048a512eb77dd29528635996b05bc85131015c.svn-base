package kr.or.ddit.market.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
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
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.headquarter.master.service.CenterBoardService;
import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.CenterDefaultVO;
import kr.or.ddit.vo.def.QnaanswerDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class CenterQNAMarketController {
	
	@Autowired
	private CenterBoardService service;
	
	@Autowired
	private QnaService qnaService; 
	
	/**
	 * 고객게시판 리스트 출력
	 * @param model
	 * @return
	 */
	@GetMapping("/centerMarketList")
	public String list(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
	){
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		// 질문리스트 가져가기
		List<CenterDefaultVO> centerList = service.retrieveAllCenterBoard(paging);
		model.addAttribute("centerList", centerList);
		
		// 답변상태 리스트표시
		List<QnaanswerDefaultVO> qnaList = qnaService.retrieveAllQnaBoard();
		model.addAttribute("qnaList", qnaList);
		
		// 페이지 랜더링
		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "market:/center/centerMarketList";
		
	}
	
	@GetMapping("/centerInsert")
	public String form() {
		
		return "market:/center/centerMemberInsert";
	}
	
	
	@PostMapping("/centerInsertData")
	public String insertData(
			@Validated(InsertGroup.class) 
			 CenterDefaultVO centerBoard
			,BindingResult errors
			,RedirectAttributes redirectAttributes
			,Authentication authentication
	) {
		String lvn = null;
		if(!errors.hasErrors()) {
//			1. 시큐리티에 저장된 회원정보를 가져온다.
			SecurityContext sc = SecurityContextHolder.getContext();
			MemberVOWrapper member = (MemberVOWrapper) sc.getAuthentication().getPrincipal();
			String memNo = member.getRealUser().getMemNo();
			centerBoard.setMemNo(memNo);
			service.registerCenterBoard(centerBoard);
			lvn = "redirect:/market/member/centerMarketList";
		}else {
			redirectAttributes.addFlashAttribute("centerBoard", centerBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"centerBoard", errors);
			lvn = "redirect:/market/member/centerMarketList";
		}
		return lvn;
		
	}
	
	
	/**
	 * 고객게시판 게시물상세 조회
	 * @param ctrBbsNo
	 * @param model
	 * @return
	 */
	@GetMapping("{ctrBbsNo}/center")
	public String detail(@PathVariable String ctrBbsNo
						, Model model) {
//		centerService.incrementHitNO(ctrBbsNo); // 조회수 증가 설정
		CenterDefaultVO center = service.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center", center);
		
		List<QnaanswerDefaultVO> qnaList = qnaService.retrieveQnaBoardList(ctrBbsNo);
		model.addAttribute("qnaList", qnaList);
		return "market:/center/centerMemberDetail";
	}
	
	
	// 로그인 설정
	// 회원 질문 상세보기 페이지
//	@GetMapping("/centerMarketDetail/{ctrBbsNo}")
//	public String detail(@PathVariable String ctrBbsNo
//						, Model model) {
//		CenterDefaultVO center = centerService.retrieveByctrBbsNo(ctrBbsNo);
//		model.addAttribute("center", center);
//		
//		return "market:/center/centerMemberDetail";
//	}
	
	// 회원 질문에 대한 관리자 답변 상세보기 페이지
//		@GetMapping("/centeranswerDetail/{ctrBbsNo}")
//		public String answerdetail(@PathVariable String qnaAnswerId
//									, Model model) {
//		QnaanswerDefaultVO qnaBoard = qnaService.retrieveByqnaId(qnaAnswerId);
//		model.addAttribute("qnaBoard", qnaBoard);
//		
//		return "market:/center/centerMemberDetail";
//			
//		}

}
