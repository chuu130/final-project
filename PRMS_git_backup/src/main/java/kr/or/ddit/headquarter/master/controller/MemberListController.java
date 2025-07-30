package kr.or.ddit.headquarter.master.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.headquarter.master.service.BlackListservice;
import kr.or.ddit.headquarter.master.service.MemberListService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.vo.def.BlacklistDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

@Controller
@RequestMapping("/main/master")
public class MemberListController {
	@Autowired
	private MemberService service;
	@Autowired
	private BlackListservice blackservice;

	@GetMapping("/memberList.do")
	public String MemberList(@RequestParam(required = false, defaultValue = "1")int page
						, Model model
						, @ModelAttribute("condition") SimpleCondition simpleCondition) {
		PaginationInfo paging = new PaginationInfo();
	    paging.setPage(page);
	    paging.setSimpleCondition(simpleCondition);

	    List<MemberDefaultVO> list = service.selectMemberListPaging(paging);
	    model.addAttribute("memberList", list);
	    PaginationRenderer renderer = new ThemeType2PaginationRenderer();
	    String pagingHTML = renderer.renderPagination(paging);
	    model.addAttribute("pagingHTML", pagingHTML);

	    Map<String, Integer> blacklistMap = new HashMap();

	    for (MemberDefaultVO vo : list) {
	        int cnt = blackservice.checkMember(vo.getMemNo());
	        blacklistMap.put(vo.getMemNo(), cnt);
	    }

	    model.addAttribute("blacklistMap", blacklistMap);
	    return "master:/master/memberList";
	}

	@PostMapping("/blackList")
	public String blackList(BlacklistDefaultVO vo ,@RequestParam String memNo) {
		vo.setMemNo(memNo);
		 System.out.println(memNo);
		blackservice.insert(vo);

		return "redirect:/main/master/memberList.do";
	}

}
