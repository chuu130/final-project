package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.franchise.franchisee.service.StoreManageService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.StoremanageDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/franchisee")
public class StoreManagefranController {
	
	@Autowired
	StoreManageService service;
	
	@GetMapping("/storemanageList") // 나의 신청목록
	public String formUI(Model model
						, String franchiseId) {
		List<StoremanageDefaultVO> storeList = service.selectStoremanageList(franchiseId);
		model.addAttribute("storeList", storeList);
		log.info("storeList 값있는지확인",storeList);
		
		return "franchisee:/center/storemanageList";
		
	}
	
	@GetMapping("/storemanageInsert")
	public String formInsertUI(  @Validated(InsertGroup.class) 
								 StoremanageDefaultVO storeBoard
								,BindingResult errors
								,RedirectAttributes redirectAttributes
								,Authentication authentication
		) {
		String lvn = null;
		if(!errors.hasErrors()) {
			EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			String franchiseId = realUser.getFranchiseId();
			storeBoard.setFranchiseId(franchiseId);
			service.insertStoremanage(storeBoard);
			lvn = "redirect:/center/storemanageList";
		}else {
			redirectAttributes.addFlashAttribute("storeBoard", storeBoard);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+"storeBoard", errors);
			lvn = "redirect:/center/storemanageList";
		}
		return "franchisee:/center/storemanageInsert";
	}
}
