package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/main/master")
public class FoundCheckRetrieveController {

	@Autowired
	private FoundService service;

	@GetMapping("foundCheckList.do")
	public String foundCheckList(@RequestParam(required = false ,defaultValue = "1") int page
									, SimpleCondition simpleCondition
									, Model model) {
		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setPage(page); //페이지 셋팅
		paging.setSimpleCondition(simpleCondition); //검색조건 셋팅

		List<FoundDefaultVO> foundList = service.foundCheckList(paging);
		model.addAttribute("fList", foundList);

		PaginationRenderer rederer = new ThemeType2PaginationRenderer();
		String pagingHTML = rederer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("hash", "foundCheckList");

		return "master:/master/foundCheckList";
	}

	@GetMapping("foundCheckDetail.do")
	public void foundDetail(@RequestParam("what") String what, Model model) {

		FoundDefaultVO found = service.foundCheckDetail(what);
		model.addAttribute("found", found);
	}

}
