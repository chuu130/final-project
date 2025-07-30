package kr.or.ddit.franchise.common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.exception.PaymentException;
import kr.or.ddit.franchise.common.service.FranchisePosService;
import kr.or.ddit.vo.FranchisePosVO;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.MultiplePaymentInfoVO;
import kr.or.ddit.vo.PosPayInfoVO;
import kr.or.ddit.vo.SetlDtVO;
import kr.or.ddit.vo.def.AdmininvDefaultVO;
import kr.or.ddit.vo.def.CancleDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.FranprodDefaultVO;
import kr.or.ddit.vo.def.FranprodsetlDefaultVO;
import lombok.Data;

@Controller
@RequestMapping("franchise")
public class FranchisePosController {

	
	@Autowired
	private FranchisePosService service;
	
	@GetMapping("/franchisePos")
	public String franchisePos(Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper franchisee = (EmployeeDefaultVOWrapper) sc.getAuthentication().getPrincipal();
		
		String franId = franchisee.getRealUser().getFranchiseId();
		
		List<FranchisePosVO> franchiseProdList = service.selectFranchiseProdList(franId);
		
		model.addAttribute("franProdList", franchiseProdList);
		
		return "franchisee/franchisePos";
	}
	
	@PostMapping("/franchiseProdDetail")
	@ResponseBody
	public FranchisePosVO selectProdDetail(@RequestParam(value= "franProdId", required=false) String franProdId) {
		FranchisePosVO franprod = service.selectFranchiseProdDetail(franProdId);
		
		
		return franprod;
		
	}
	
	@PostMapping(value = "/franchisePosPayment")
	public void franchisePosPayment(@RequestBody PosPayInfoVO posPayInfo
			,Model model
			,HttpServletResponse resp) throws IOException {
		
		System.out.println(posPayInfo);
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper employeeVO = (EmployeeDefaultVOWrapper)(sc.getAuthentication().getPrincipal());
		String franId = employeeVO.getRealUser().getFranchiseId();
		String franNo = employeeVO.getRealUser().getEmpId();
		posPayInfo.setFranId(franId);
		int totalPc = posPayInfo.getTotal();
		
		System.out.println(franNo);
		
		
		
			service.insertPaymentInfo(franId, totalPc, posPayInfo);
			
			service.insertPaymentDetailInfo(posPayInfo);
			
			String franSetlNo = service.selectSetlPK(franId);
			
			service.insertFranPosSelling(franId, franSetlNo, posPayInfo);
			
			

		model.addAttribute("franNo", franNo);
			

		
	}
	
	@GetMapping(value = "franchisePosHistory")
	public String franchisePosHistory(Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper employeeVO = (EmployeeDefaultVOWrapper)(sc.getAuthentication().getPrincipal());
		String franId = employeeVO.getRealUser().getFranchiseId();
		
		List<SetlDtVO> posHistoryList = service.selectPosHistoryList(franId);
		
		
		
		model.addAttribute("posHistoryList", posHistoryList);
		model.addAttribute("hash", "franchisePosHistory");
		
		return "franchisee:/franchisee/franchisePosHistory";
	}
	
	@GetMapping(value = "franchisePosCancleHistory")
	public String fanchisePosCancleHistory(Model model) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper employeeVO = (EmployeeDefaultVOWrapper)(sc.getAuthentication().getPrincipal());
		String franId = employeeVO.getRealUser().getFranchiseId();
		
		
		List<SetlDtVO> posCancleList = service.selectPosCancleList(franId);
		
		model.addAttribute("posCancleList", posCancleList);
		model.addAttribute("hash", "franchisePosCancleHistory");
		
		return "franchisee:franchisee/franchisePosCancleHistory";
	}
	
	
	@PostMapping("franchisePosCancle")
	@ResponseBody
	public String franchisePosCancle(@RequestParam(value= "franprodSetlNo", required=false) String franprodSetlNo) {
		
		service.insertPosCancle(franprodSetlNo);
		service.updatePosCancleYn(franprodSetlNo);
		
		FranprodsetlDefaultVO franprodSetl = service.selectExpensePK(franprodSetlNo);
		String franId = franprodSetl.getFranchiseId();
		int totalPc = franprodSetl.getFranchiseSetlPc();
		
		service.insertFranPosExpense(franId, franprodSetlNo, totalPc);
		
		return "redirect:/franchise/franchisePosHistory";
		
	}
	
	@PostMapping("/posDate")
	@ResponseBody
	public List<SetlDtVO> posDate(@RequestParam(value= "date", required=false) String date
			) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper employeeVO = (EmployeeDefaultVOWrapper)(sc.getAuthentication().getPrincipal());
		String franId = employeeVO.getRealUser().getFranchiseId();
		
		System.out.println("date:" +date);
		
		return service.selectPosDate(franId, date);
		
		
		
	}
	
	@PostMapping("/posCancleDate")
	@ResponseBody
	public List<SetlDtVO> posCancleDate(@RequestParam(value= "date", required=false) String date
			) {
		
		SecurityContext sc = SecurityContextHolder.getContext();
		EmployeeDefaultVOWrapper employeeVO = (EmployeeDefaultVOWrapper)(sc.getAuthentication().getPrincipal());
		String franId = employeeVO.getRealUser().getFranchiseId();
		
		System.out.println("date:" +date);
		
		return service.selectPosCancleDate(franId, date);
		
		
		
	}

}
