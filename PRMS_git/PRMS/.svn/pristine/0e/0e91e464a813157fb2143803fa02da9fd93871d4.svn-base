package kr.or.ddit.headquarter.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.InvPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.headquarter.common.service.HeadquarterProdService;
import kr.or.ddit.vo.HeadquarterProdVO;

@Controller
@RequestMapping("/main/master")
public class HeadquarterProdController {

	@Autowired
	private HeadquarterProdService service;
	
	@GetMapping("/adminProdList.do")
	public String selelctMaster(@RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(value="name", required = false ,defaultValue = "") String name
			,@ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		
		if(!name.equals("") ) {
			PaginationInfo paging = new PaginationInfo(5, 5);
			paging.setPage(page);
			paging.setSimpleCondition(simpleCondition);
			int fistRecord = paging.getFirstRecord();
			int lastRecord = paging.getLastRecord();
			
			List<HeadquarterProdVO> list = service.selectProdDropdownList(name, fistRecord, lastRecord, paging);
			
			model.addAttribute("adminProdList", list);
			model.addAttribute("name", name);
			
			PaginationRenderer renderer = new InvPaginationRenderer();
			String pagingHTML = renderer.renderPagination(paging);
			model.addAttribute("pagingHTML", pagingHTML);
			
			return "master:master/adminProdList";
		}
		PaginationInfo paging = new PaginationInfo(5, 5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		int fistRecord = paging.getFirstRecord();
		int lastRecord = paging.getLastRecord();
		
		List<HeadquarterProdVO> list = service.selectHeadquarterProdList(paging, fistRecord, lastRecord);
		
		model.addAttribute("adminProdList", list);
		
		PaginationRenderer renderer = new InvPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "master:master/adminProdList";
	}
	
	
	@GetMapping("/prodDetail.do")
	public String prodDetail(@RequestParam(value="prodId", required = false) String prodId
			,Model model) {
		
		HeadquarterProdVO prod = service.selectProdDetail(prodId);
		
		model.addAttribute("prodDetail", prod);
		
		return "master:master/adminProdDetail";
	}
	
	@PostMapping("/adminProdList.do")
	@ResponseBody
	public Map<String, Object> prodDropdown(@RequestParam(value="name", required = false) String name
			, @RequestParam(required = false, defaultValue = "1") int page
			,@ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		
		if(name.equals("")) {
			PaginationInfo paging = new PaginationInfo(5, 5);
			paging.setPage(page);
			paging.setSimpleCondition(simpleCondition);
			int fistRecord = paging.getFirstRecord();
			int lastRecord = paging.getLastRecord();
			
			List<HeadquarterProdVO> list = service.selectHeadquarterProdList(paging, fistRecord, lastRecord);
			
			model.addAttribute("adminProdList", list);
			
			PaginationRenderer renderer = new InvPaginationRenderer();
			String pagingHTML = renderer.renderPagination(paging);
			model.addAttribute("pagingHTML", pagingHTML);
			
			Map<String, Object> map = new HashMap<>();
			
			
			
			map.put("adminProdList", list);
			map.put("name", name);
			map.put("pagingHTML", pagingHTML);
			
			return map;
		}
		
		PaginationInfo paging = new PaginationInfo(5, 5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		int fistRecord = paging.getFirstRecord();
		int lastRecord = paging.getLastRecord();
		
		List<HeadquarterProdVO> list = service.selectProdDropdownList(name, fistRecord, lastRecord, paging);
		
		model.addAttribute("adminProdList", list);
		model.addAttribute("name", name);
		
		PaginationRenderer renderer = new InvPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);
		model.addAttribute("pagingHTML", pagingHTML);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("adminProdList", list);
		map.put("name", name);
		map.put("pagingHTML", pagingHTML);
		
		
		return map;
		
		
	}
}
