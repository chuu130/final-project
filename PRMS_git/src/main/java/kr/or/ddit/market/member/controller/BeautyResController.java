package kr.or.ddit.market.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.CmmncodeDefaultMapper;
import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.main.mapper.EmployeeMapper;
import kr.or.ddit.market.member.service.BeautyResService;
import kr.or.ddit.market.member.service.BeautyTimeService;
import kr.or.ddit.market.member.service.PetService;
import kr.or.ddit.market.member.service.ResSetlService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.BeautyresDefaultVO;
import kr.or.ddit.vo.def.BeautytimeDefaultVO;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.PetDefaultVO;
import kr.or.ddit.vo.def.RessetlDefaultVO;

@Controller
@RequestMapping("/market/member/beautyRes")
public class BeautyResController {

    @Autowired
    BeautyTimeService timeService;

    @Autowired
    BeautyResService resService;

    @Autowired
    PetService petService;

    @Autowired
    ResSetlService setlService;

    @Autowired
    EmployeeMapper empmapper;

	@Autowired
	FranchiseInfoService franService;

    @Autowired
	@Qualifier("cmmncodeDefaultMapper")
	CmmncodeDefaultMapper cmmnmapper;

	@ModelAttribute("beautyOption")
	public List<CmmncodeDefaultVO> beautyOption() {
		return cmmnmapper.selectByCmmncl("COMN13");
	}
	@ModelAttribute("petOption")
	public List<CmmncodeDefaultVO> petOption() {
		return cmmnmapper.selectByCmmncl("COMN08");
	}
	@ModelAttribute("weightOption")
	public List<CmmncodeDefaultVO> weightOption() {
		return cmmnmapper.selectByCmmncl("COMN07");
	}

	@ModelAttribute("pet")
	public PetDefaultVO pet() {
		return new PetDefaultVO();
	}
	@ModelAttribute("res")
	public BeautyresDefaultVO res() {
		return new BeautyresDefaultVO();
	}

	/**
	 * 미용 예약 페이지로 이동
	 * @param authentication
	 * @param model
	 * @param redirectAttributes
	 * @param franchiseId
	 * @return
	 */
	@GetMapping("/{franchiseId}")
	public String beautyResPage(Authentication authentication
			,Model model
			,RedirectAttributes redirectAttributes
			,@PathVariable String franchiseId) {

		if(authentication != null) {
			FranchiseDefaultVO franchise = franService.retrieveFranchiseDetail(franchiseId);
			model.addAttribute("franchise", franchise);
			
			List<BeautyresDefaultVO> beautyList = resService.selectBeautyReviewList(franchiseId);
			model.addAttribute("beautyList", beautyList);

			return "market:market/beautyRes";
		}else {
			redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스입니다!");
			return "redirect:/market/beauty";
		}

	}

    /**
     * 특정 날짜에 해당하는 예약 가능 시간과 직원번호 가져옴
     * @param data
     * @return
     */
    @PostMapping("/date")
    @ResponseBody
    public HashMap<String, String> checkResDate(@RequestBody HashMap<String, String> data) {

    	List<EmployeeDefaultVO> allEmp = empmapper.selectByFranchiseId(data.get("franchiseId"));

    	List<String> allEmpNos = new ArrayList<>(); // 모든 직원 번호 리스트

    	for(EmployeeDefaultVO emp : allEmp) {
    		allEmpNos.add(emp.getEmpNo());
    	}

    	return timeService.checkAvailableSlots(data, allEmpNos);
    }

    /**
     * 미용 예약
     * @param pet
     * @param petErrors
     * @param res
     * @param resErrors
     * @param option
     * @param optionErrors
     * @param redirectAttributes
     * @param authentication
     * @return
     */
    @PostMapping()
    public String insert(
        @Validated(InsertGroup.class) @ModelAttribute("pet") PetDefaultVO pet,
        BindingResult petErrors,
        @Validated(InsertGroup.class) @ModelAttribute("res") BeautyresDefaultVO res,
        BindingResult resErrors,
        RedirectAttributes redirectAttributes,
        Authentication authentication
    ) {
        // 각 모델에 대한 오류 체크
        if (petErrors.hasErrors() || resErrors.hasErrors()) {
            // 오류가 있는 경우 처리
            redirectAttributes.addFlashAttribute("petErrors", petErrors);
            redirectAttributes.addFlashAttribute("resErrors", resErrors);

            // 폼에 오류 메시지를 표시하거나 다른 처리를 위해 리디렉션
            return "redirect:/market/member/beautyRes/"+res.getFranchiseId(); // 오류 시 폼 페이지로 돌아감
        }

        // 반려동물 정보 생성
        String petNo = petService.createPet(pet);

        res.setPetNo(petNo);

        // 예약정보 생성
        String resBeautyNo = resService.createBeautyRes(res);
        res.setResBeautyNo(resBeautyNo);

        // 선택한 예약 날짜가 존재하는지 확인 > currResTime이 null이 아니면 존재함
        HashMap<String, String> inputData = new HashMap<String, String>();
		inputData.put("resBeautyDe", res.getResBeautyDe());
		inputData.put("empNo", res.getEmpNo());
		inputData.put("franchiseId", res.getFranchiseId());

		// 예약 날짜가 존재하는 경우 currResTime 사용, 없으면 insert 후 사용
		BeautytimeDefaultVO currResTime = timeService.retrieveBeautyTime(inputData);

		// 예약 날짜가 존재하지 않는 경우 새로 생성
		if(currResTime == null) {
			BeautytimeDefaultVO newResTime = new BeautytimeDefaultVO();
			newResTime.setEmpNo(res.getEmpNo());
			newResTime.setFranchiseId(res.getFranchiseId());
			newResTime.setResBeautyDe(res.getResBeautyDe());
			timeService.createBeautyTime(newResTime);
			// insert 후 다시 가져옴
			currResTime = timeService.retrieveBeautyTime(inputData);
		}

		String realTime = res.getResBeautyTime();

		// realTime에 따라서 시간슬롯 'Y'로 변경
		if(realTime.equals("9:00")) currResTime.setResHr1("Y");
		else if(realTime.equals("10:00")) currResTime.setResHr2("Y");
		else if(realTime.equals("11:00")) currResTime.setResHr3("Y");
		else if(realTime.equals("13:00")) currResTime.setResHr4("Y");
		else if(realTime.equals("14:00")) currResTime.setResHr5("Y");
		else if(realTime.equals("15:00")) currResTime.setResHr6("Y");
		else if(realTime.equals("16:00")) currResTime.setResHr7("Y");
		else if(realTime.equals("17:00")) currResTime.setResHr8("Y");
		else if(realTime.equals("18:00")) currResTime.setResHr9("Y");

		// 시간슬롯 수정
		timeService.modifyBeautyTime(currResTime);


		RessetlDefaultVO resSetlInfo = new RessetlDefaultVO();
		resSetlInfo.setResBeautyNo(resBeautyNo);
		resSetlInfo.setResSetlNm(res.getResOption());
		resSetlInfo.setResSetlPc(res.getResBeautyPrice());

		// 결제정보 등록
		setlService.createBeautySetl(resSetlInfo);

		// 본사매출 반영
		resService.createBeautyResSell(res);

		redirectAttributes.addFlashAttribute("message", "예약이 완료되었습니다.");

		MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
		MemberDefaultVO realUser = wrapper.getRealUser();
		String memNo = realUser.getMemNo();

		return "redirect:/market/member/" + memNo + "/beautyResDetail"; // 성공 후 리디렉션

    }



}
