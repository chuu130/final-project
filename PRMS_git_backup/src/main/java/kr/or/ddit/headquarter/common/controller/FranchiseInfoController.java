package kr.or.ddit.headquarter.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.CmmncodeDefaultMapper;
import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.RetailPaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HeadquarterDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main/master/franchise")
public class FranchiseInfoController {
	public static final String MODELNAME = "franchise";

	@Autowired
	private FranchiseInfoService service;

	@Autowired
	@Qualifier("cmmncodeDefaultMapper")
	private CmmncodeDefaultMapper cmmnmapper;

	@GetMapping
	public String list(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model) {
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);
		List<FranchiseDefaultVO> franchiseList = service.retrieveFranchiseList(paging);

		model.addAttribute("franchiseList", franchiseList);

		PaginationRenderer renderer = new RetailPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);

		return "master:master/franchiseList";
	}

	@GetMapping("/{franchiseId}")
	public String detail(@PathVariable String franchiseId, Model model) {
		FranchiseDefaultVO franchise = service.retrieveFranchiseDetail(franchiseId);
		model.addAttribute("franchise", franchise);
		return "master:master/franchiseDetail";
	}

	@PostMapping("/{franchiseId}/update")
	public String update(@Validated(UpdateGroup.class) @ModelAttribute(MODELNAME) FranchiseDefaultVO franchise
			, BindingResult errors
			, RedirectAttributes redirectAttributes) {
		if(!errors.hasErrors()) {
			service.modifyFranchise(franchise);
			redirectAttributes.addFlashAttribute("message", "정상적으로 수정되었습니다.");
			return "redirect:/main/master/franchise/{franchiseId}";
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, franchise);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			redirectAttributes.addFlashAttribute("message", "수정에 실패했습니다.");
			return "redirect:/main/master/franchise/{franchiseId}/update";
		}
	}

	@GetMapping("/{franchiseId}/update")
	public String updateform(@PathVariable String franchiseId, Model model) {
		if(!model.containsAttribute(MODELNAME)) {
			FranchiseDefaultVO franchise = service.retrieveFranchiseDetail(franchiseId);
			model.addAttribute("franchise", franchise);
		}
		List<CmmncodeDefaultVO> areaCode = cmmnmapper.selectByCmmncl("COMN15");
		model.addAttribute("areaCode", areaCode);

		return "master:master/franchiseEdit";
	}

	@GetMapping("/franchiseListInfo")
	@ResponseBody
	public List<FranchiseDefaultVO> retreiveFranchiseList(){

		List<FranchiseDefaultVO> franchiseInfo = service.retrieveFranchiseInfoList();
		return franchiseInfo;

	}

	@GetMapping("/headInfo")
	@ResponseBody
	public HeadquarterDefaultVO retrieveHead(Authentication authentication) {

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		String empId = realUser.getHqId();

//		log.info("empId는 뭘까???????????????????{}",empId);

		HeadquarterDefaultVO headInfo = service.retrieveHeadInfo(empId);
		return headInfo;
	}

}
