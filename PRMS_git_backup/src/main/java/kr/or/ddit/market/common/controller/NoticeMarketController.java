package kr.or.ddit.market.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.market.common.service.AtchFileService;
import kr.or.ddit.market.common.service.NoticeService;
import kr.or.ddit.vo.AtchfileVO;
import kr.or.ddit.vo.def.NoticeDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/market/member")
public class NoticeMarketController {
	
	@Autowired
	private NoticeService service;
	
	@Autowired
	private AtchFileService atchFileService;
	
	
	@GetMapping("/noticeList")
	public String list(Model model
			,@RequestParam(required = false, defaultValue = "1") int page	
			, @ModelAttribute("condition") SimpleCondition simpleCondition
		){
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		
		List<NoticeDefaultVO> noticeList = service.retrieveAllNotice(paging);
		model.addAttribute("noticeList", noticeList);
		
		// 페이지 랜더링
		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "market:/notice/noticeMarketList";
		
	}
	
	@GetMapping("{noticeBbsNo}/notice")
	public String detail(@PathVariable String noticeBbsNo
						, Model model) {
		service.incrementHitNO(noticeBbsNo); // 조회수 증가 설정
		NoticeDefaultVO notice = service.retrieveByNoticeNo(noticeBbsNo);
		Integer atchFileId = notice.getNoticeBbsAtch(); 
		
		AtchfileVO atchvo = atchFileService.readAtchFileEnable(atchFileId, null);
		notice.setAtchFile(atchvo);
		
		model.addAttribute("notice", notice);
		
		return "market:/notice/noticeMarketDetail";
	}
}