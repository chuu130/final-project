package kr.or.ddit.headquarter.common.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.DefaultPaginationRenderer;
import kr.or.ddit.commons.paging.InvPaginationRenderer;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.headquarter.common.service.AdminInvService;
import kr.or.ddit.vo.AdminInvDataDetailVO;
import kr.or.ddit.vo.AdminInvDataVO;
import kr.or.ddit.vo.AdminInvVO;
import kr.or.ddit.vo.HeadquarterProdVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;

@Controller
@RequestMapping("/main/master")
public class AdminInvController{
	
	@Autowired
	private AdminInvService service;
	
	@GetMapping("/adminInvList.do")
	public String selelctMaster(
			@ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		
//		List<AdminInvVO> list = service.selectAdminInvProdList();
		List<AdminInvDataVO> data = service.selectDataTable();
//		model.addAttribute("adminInvProdList", list);
		model.addAttribute("adminInvProdList", data);
		model.addAttribute("hash", "adminInvList");
		
		
		return "master:master/adminInvTest";
	}
	
	@ResponseBody
	@RequestMapping(value = "/dataTables")
	public List<AdminInvDataVO> dataTable(AdminInvVO adminInvVo) {
		
		List<AdminInvDataVO> data = service.selectDataTable();
		
//		model.addAttribute("adminInvProdList", list);
		System.out.println(data);
		
		
		return data;
	}
	
	@PostMapping("/adminInvList")
	@ResponseBody
	public List<AdminInvDataVO> prodDropdown(@RequestParam(value="name", required = false) String name
			, Model model) {
		
		if(name.equals("전체")) {
			
			List<AdminInvDataVO> list = service.selectDataTable();
			
			model.addAttribute("adminProdList", list);
			
			
			return list;
		}
		
		
		List<AdminInvDataVO> list = service.selectDataTableDropdown(name);
		
		model.addAttribute("adminProdList", list);
		
		
		
		
		return list;
		
		
	}
	
	@PostMapping("/adminInvDetail.do")
	@ResponseBody
	public List<AdminInvDataDetailVO> selectProdDetail(@RequestParam(value= "prodId", required=false) String prodId) {
		List<AdminInvDataDetailVO> prodDetail = service.selectProdDetail(prodId);
		
		
		return prodDetail;
		
	}
	
	@PostMapping("/updateAdminInvQy.do")
	@ResponseBody
	public String updateAdminInvQy(@RequestParam(value="prodId", required = false) String prodId
			,@RequestParam(value="admininvQy", required = false) int admininvQy) {
		
		AdminInvVO adminInv = new AdminInvVO();
		adminInv.setProdId(prodId);
		adminInv.setAdmininvQy(admininvQy);
		
		int cnt = service.updateAdminInvQy(adminInv);
		
		
		return "master:master/adminInvList";
	}
	
	
	
	@GetMapping("{prodId}")
	public String DetailInv(@PathVariable String prodId, Model model) {
		AdmininvDefaultVO invVO = service.selectAdminInv(prodId);
		model.addAttribute("InvVO", invVO);
		
		return "master:/master/adminInvDetail";
	}
	
	@PostMapping("/update")
	public String updateInv(AdmininvDefaultVO invVO) {
		service.updateAdminInv(invVO);
		
		return "redirect:/master/adminInvList.do";
	}
	
	@PostMapping("/delete")
	public String deleteInv(String prodId) {
		service.deleteAdminInv(prodId);
		
		return "redirect:/masterpage.do";
	}
}
