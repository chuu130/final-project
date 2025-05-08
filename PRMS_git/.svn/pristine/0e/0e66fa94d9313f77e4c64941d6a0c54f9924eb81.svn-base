package kr.or.ddit.market.member.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.CmmncodeDefaultMapper;
import kr.or.ddit.franchise.franchisee.service.HotelroomService;
import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.market.member.service.HotelResService;
import kr.or.ddit.market.member.service.HotelTimeService;
import kr.or.ddit.market.member.service.PetService;
import kr.or.ddit.market.member.service.ResSetlService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.BeautyresDefaultVO;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HotelresDefaultVO;
import kr.or.ddit.vo.def.HotelroomDefaultVO;
import kr.or.ddit.vo.def.HoteltimeDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.PetDefaultVO;
import kr.or.ddit.vo.def.RessetlDefaultVO;

@Controller
@RequestMapping("/market/member/hotelRes")
public class HotelResController {

	@Autowired
	FranchiseInfoService franService;

	@Autowired
	HotelTimeService timeService;

	@Autowired
	HotelroomService roomService;

	@Autowired
	HotelResService resService;

	@Autowired
	PetService petService;

	@Autowired
	ResSetlService setlService;

	@Autowired
	@Qualifier("cmmncodeDefaultMapper")
	CmmncodeDefaultMapper cmmnmapper;

	@ModelAttribute("res")
	public HotelresDefaultVO res() {
		return new HotelresDefaultVO();
	}

	@ModelAttribute("pet")
	public PetDefaultVO pet() {
		return new PetDefaultVO();
	}

	@ModelAttribute("petOption")
	public List<CmmncodeDefaultVO> petOption() {
		return cmmnmapper.selectByCmmncl("COMN08");
	}

	@ModelAttribute("roomOption")
	public List<CmmncodeDefaultVO> roomOption() {
		return cmmnmapper.selectByCmmncl("COMN14");
	}

	@GetMapping("/{franchiseId}")
	public String hotelResPage(Authentication authentication
			,Model model
			,RedirectAttributes redirectAttributes
			,@PathVariable String franchiseId) {

		if(authentication != null) {
			FranchiseDefaultVO franchise = franService.retrieveFranchiseDetail(franchiseId);
			model.addAttribute("franchise", franchise);

			return "market:market/hotelRes";
		}else {
			redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스입니다!");
			return "redirect:/market/hotel";
		}

	}

	@PostMapping("/date")
    @ResponseBody
    public List<HotelroomDefaultVO> checkResDate(@RequestBody HashMap<String, String> data) {
		return timeService.retrieveHotelroomByDate(data);
	}

	@GetMapping("/hotel/{hotelId}")
    public String hotelRes(
    		@PathVariable String hotelId,
            @RequestParam String resHotelInDe,
            @RequestParam String resHotelOutDe,
            @RequestParam String franchiseId,
            Model model) {

		FranchiseDefaultVO franchise = franService.retrieveFranchiseDetail(franchiseId);
		HotelroomDefaultVO hotelroom = roomService.retrieveHotelroom(hotelId);

		// 날짜 형식 지정
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        // 문자열을 LocalDate로 변환
        LocalDate date1 = LocalDate.parse(resHotelInDe, formatter);
        LocalDate date2 = LocalDate.parse(resHotelOutDe, formatter);

        // 두 날짜 사이의 일수 계산
        int daysBetween = (int) ChronoUnit.DAYS.between(date1, date2);

        HotelresDefaultVO res = new HotelresDefaultVO();
        res.setResHotelInDe(resHotelInDe);
        res.setResHotelOutDe(resHotelOutDe);
        res.setResHotelNight(daysBetween);
        // 호텔 총액 지정
        res.setResHotelPrice(daysBetween*hotelroom.getHotelPrice());

        model.addAttribute("franchise", franchise);
        model.addAttribute("hotelroom", hotelroom);
        model.addAttribute("resInfo", res);


        // 상세 예약 페이지로 이동
		return "market:market/hotelResInfo";
    }

	@PostMapping("/hotel/{hotelId}")
	public String insert(
	    @Validated(InsertGroup.class) @ModelAttribute("pet") PetDefaultVO pet,
	    BindingResult petErrors,
	    @Validated(InsertGroup.class) @ModelAttribute("res") HotelresDefaultVO res,
	    BindingResult resErrors,
	    RedirectAttributes redirectAttributes,
	    Authentication authentication) {

	    if (petErrors.hasErrors() || resErrors.hasErrors()) {
	        // 오류가 있는 경우 처리
	        redirectAttributes.addFlashAttribute("petErrors", petErrors);
	        redirectAttributes.addFlashAttribute("resErrors", resErrors);

	        return "redirect:/market/member/hotelRes/hotel/" + res.getHotelId();
	    }

	    // 반려동물 정보 생성
	    String petNo = petService.createPet(pet);

	    res.setPetNo(petNo);

	    // 예약정보 생성
	    String resHotelNo = resService.createHotelRes(res);
	    
	    res.setResHotelNo(resHotelNo);

	    String hotelId = res.getHotelId();

	    // 예약 시작일, 종료일
	    String startDate = res.getResHotelInDe();
	    String endDate = res.getResHotelOutDe();

	    LocalDate start = LocalDate.parse(startDate);
	    LocalDate end = LocalDate.parse(endDate);

	    for (LocalDate date = start; !date.isAfter(end); date = date.plusDays(1)) {
	        String currentDate = date.toString();

	        HashMap<String, String> inputData = new HashMap<>();
	        inputData.put("resHotelDe", currentDate);
	        inputData.put("hotelId", hotelId);

	        HoteltimeDefaultVO currResTime = timeService.retrieveHotelTime(inputData);

	        if (currResTime == null) {
	            HoteltimeDefaultVO newResTime = new HoteltimeDefaultVO();
	            newResTime.setResHotelDe(currentDate);
	            newResTime.setHotelId(hotelId);
	            timeService.createHotelTime(newResTime);
	            currResTime = timeService.retrieveHotelTime(inputData);
	        }

	        if (date.equals(start)) {
	            currResTime.setResPm("Y");
	        } else if (date.equals(end)) {
	            currResTime.setResAm("Y");
	            if(res.getResHotelLateout() > 0) {
	            	currResTime.setResPm("Y");
	            }
	        } else {
	            currResTime.setResAm("Y");
	            currResTime.setResPm("Y");
	        }

	        // 타임슬롯 수정
	        timeService.modifyHotelTime(currResTime);
	    }


	    RessetlDefaultVO resSetlInfo = new RessetlDefaultVO();
		resSetlInfo.setResHotelNo(resHotelNo);
		resSetlInfo.setResSetlNm(res.getHotelNm());
		resSetlInfo.setResSetlPc(res.getResHotelPrice()+res.getResHotelLateout());

	    // 결제정보 등록
	 	setlService.createHotelSetl(resSetlInfo);

	    // 본사매출 반영
	 	resService.createHotelResSell(resHotelNo);
	 	
	    MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
	    MemberDefaultVO realUser = wrapper.getRealUser();
	    String memNo = realUser.getMemNo();

	    return "redirect:/market/member/" + memNo + "/hotelResDetail";
	}


}
