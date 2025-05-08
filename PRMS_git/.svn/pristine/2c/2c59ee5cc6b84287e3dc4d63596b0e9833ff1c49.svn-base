package kr.or.ddit.franchise.franchisee.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.franchise.franchisee.service.FranFranInvService;
import kr.or.ddit.vo.def.InventoryDefaultVO;

@Controller
@RequestMapping("/main/franchisee")
public class FranFranInvReturnUpdateController {

	@Autowired
	FranFranInvService service;

	@GetMapping("franFranInvReturn.do")
	@Transactional
	public String franUpdateFranInvReturn(InventoryDefaultVO inventory
											, @RequestParam(value = "searchWord", required = false) String searchWord
											, @RequestParam(value = "searchType" , required = false) String searchType
											, @RequestParam(value = "page" , required = false) int page
											, String franchiseId
	) throws UnsupportedEncodingException {

		service.modifyFranInvReturn(inventory);
		service.modifyAdminInvReturn(inventory);
		service.createFranReturnSell(inventory, franchiseId);
		service.createAdminReturnExp(inventory);


		//주소로 넘길때 한글인코드 방지
		String searchWordEncoded = URLEncoder.encode(searchWord, StandardCharsets.UTF_8.toString());
		return "redirect:/main/franchisee/franFranInvList.do?searchType="+searchType+"&searchWord="+searchWordEncoded+"&page="+page;
	}

	@GetMapping("franFranInvDispose.do")
	@Transactional
	public String franUpdateFranInvDispose(InventoryDefaultVO inventory
											, @RequestParam(value = "searchWord", required = false) String searchWord
											, @RequestParam(value = "searchType" , required = false) String searchType
											, @RequestParam(value = "page" , required = false) int page
	) throws UnsupportedEncodingException {

		service.modifyFranInvDispose(inventory);

		//주소로 넘길때 한글인코드 방지
		String searchWordEncoded = URLEncoder.encode(searchWord, StandardCharsets.UTF_8.toString());
		return "redirect:/main/franchisee/franFranInvList.do?searchType="+searchType+"&searchWord="+searchWordEncoded+"&page="+page;
	}
}
