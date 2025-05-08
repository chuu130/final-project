package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.headquarter.master.service.QnaService;
import kr.or.ddit.market.member.service.centerQnaMarketService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.def.CenterDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.QnaanswerDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 회원의 문의글에대한 답변을 달아주는 본사 컨트롤러
 * @author PC-12
 *
 */
@Slf4j
@Controller
@RequestMapping("/main/master")
public class CenterQnaMasterController {
	
	@Autowired
	private centerQnaMarketService centerService;
	
	@Autowired
	private QnaService qnaService; 
	

	@GetMapping(value= "/centerMasterList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<CenterDefaultVO> centerformData() {
		List<CenterDefaultVO> centerList = centerService.retrieveAllMergeBoard();
		// 두개의 테이블 정보를 가진 centerList가져와서 비동기 리스트처리 
		return centerList;
		
	}
	
	// 관리자가 답변을 달아줄때 회원의 글도 함께 보여준다
	@GetMapping("/centerMasterInsertUI/{ctrBbsNo}")
	    public String insertUI(@PathVariable String ctrBbsNo, Model model) {
			CenterDefaultVO center = centerService.retrieveByctrBbsNo(ctrBbsNo);
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
			
			lvn = "redirect:/main/master/centerMasterList";
		}else {
			redirectAttributes.addFlashAttribute("qnaBoard", qnaBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"qnaBoard", errors);
			lvn = "redirect:/main/master/centerMasterList";
		}
		return lvn;
		
	}
	
	// 회원 질문 상세보기 페이지
	@GetMapping("/questDetail/{ctrBbsNo}")
	public String questdetail(@PathVariable String ctrBbsNo
							 	, Model model) {
		CenterDefaultVO center = centerService.retrieveByctrBbsNo(ctrBbsNo);
		model.addAttribute("center", center);
		
		return "master:/center/centerMemberDetail";
	}
	
	// 회원 질문에 대한 관리자 답변 상세보기 페이지
	@GetMapping("/answerDetail/{qnaAnswerId}")
	public String answerdetail(@PathVariable String qnaAnswerId
								, Model model) {
		QnaanswerDefaultVO qnaBoard = qnaService.retrieveByqnaId(qnaAnswerId);
		model.addAttribute("qnaBoard", qnaBoard);
		
		return "master:/center/centerMasterDetail";
		
	}
}
