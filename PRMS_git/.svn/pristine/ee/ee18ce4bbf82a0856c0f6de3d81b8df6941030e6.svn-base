package kr.or.ddit.market.member.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType1PaginationRenderer;
import kr.or.ddit.market.member.service.BeautyResService;
import kr.or.ddit.market.member.service.BeautyTimeService;
import kr.or.ddit.market.member.service.HotelResService;
import kr.or.ddit.market.member.service.HotelTimeService;
import kr.or.ddit.market.member.service.MemberService;
import kr.or.ddit.market.member.service.ResSetlService;
import kr.or.ddit.vo.MemberVOWrapper;
import kr.or.ddit.vo.def.BeautyresDefaultVO;
import kr.or.ddit.vo.def.BeautytimeDefaultVO;
import kr.or.ddit.vo.def.HotelresDefaultVO;
import kr.or.ddit.vo.def.HoteltimeDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;

@Controller
@RequestMapping("/market/member")
public class resDetailController {

	@Autowired
	BeautyResService service;

	@Autowired
	BeautyTimeService timeService;

	@Autowired
	HotelResService hotelService;

	@Autowired
	HotelTimeService hotelTimeService;

	@Autowired
	ResSetlService setlService;

	@Autowired
	private MemberService memService;

	@GetMapping("/{memNo}/beautyResDetail")
	public String beautyResList(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
			, @PathVariable("memNo") String memNo) {

		PaginationInfo paging = new PaginationInfo(4,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		HashMap<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("paging", paging);
		inputData.put("memNo", memNo);

		List<BeautyresDefaultVO> resList = service.retrieveResListByMem(inputData);

		model.addAttribute("resList", resList);

		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		MemberDefaultVO memVO = memService.selectMember(memNo);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("memberVO", memVO);

		return "market:member/beautyResDetail";
	}

	@PostMapping("/{resBeautyNo}/cancel")
	public String beautyResPage(
			Model model
			,RedirectAttributes redirectAttributes
			,Authentication authentication
			,@PathVariable String resBeautyNo) {

		// 예약상태 예약취소로 변경
		service.cancelBeautyRes(resBeautyNo);

		// resBeautyNo에 해당하는 예약정보 가져옴
		BeautyresDefaultVO resInfo = service.retrieveResInfo(resBeautyNo);

		HashMap<String, String> inputData = new HashMap<String, String>();
		inputData.put("resBeautyDe", resInfo.getResBeautyDe());
		inputData.put("empNo", resInfo.getEmpNo());
		inputData.put("franchiseId", resInfo.getFranchiseId());

		// 예약 시간 정보 가져옴
		BeautytimeDefaultVO currResTime = timeService.retrieveBeautyTime(inputData);

		String realTime = resInfo.getResBeautyTime();

		// realTime에 따라서 시간슬롯 'N'로 변경
		if(realTime.equals("9:00")) currResTime.setResHr1("N");
		else if(realTime.equals("10:00")) currResTime.setResHr2("N");
		else if(realTime.equals("11:00")) currResTime.setResHr3("N");
		else if(realTime.equals("13:00")) currResTime.setResHr4("N");
		else if(realTime.equals("14:00")) currResTime.setResHr5("N");
		else if(realTime.equals("15:00")) currResTime.setResHr6("N");
		else if(realTime.equals("16:00")) currResTime.setResHr7("N");
		else if(realTime.equals("17:00")) currResTime.setResHr8("N");
		else if(realTime.equals("18:00")) currResTime.setResHr9("N");

		// 시간슬롯 수정
		timeService.modifyBeautyTime(currResTime);

		// 결제정보 환불로 변경
		setlService.cancelBeautySetl(resBeautyNo);
		
		// 지출내역 등록
		service.createBeautyResExp(resInfo);

		redirectAttributes.addFlashAttribute("message", "예약이 정상적으로 취소되었습니다.");

		MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
		MemberDefaultVO realUser = wrapper.getRealUser();
		String memNo = realUser.getMemNo();

		return "redirect:/market/member/" + memNo + "/beautyResDetail"; // 성공 후 리디렉션
	}

	@GetMapping("/{memNo}/hotelResDetail")
	public String hotelResList(
			@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
			, @PathVariable("memNo") String memNo) {

		PaginationInfo paging = new PaginationInfo(4,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		HashMap<String, Object> inputData = new HashMap<String, Object>();
		inputData.put("paging", paging);
		inputData.put("memNo", memNo);

		List<HotelresDefaultVO> resList = hotelService.retrieveResListByMem(inputData);

		model.addAttribute("resList", resList);

		PaginationRenderer renderer = new ThemeType1PaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		MemberDefaultVO memVO = memService.selectMember(memNo);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("memberVO", memVO);

		return "market:member/hotelResDetail";
	}

	@PostMapping("/{resHotelNo}/hotelCancel")
	public String hotelResPage(
			Model model
			,RedirectAttributes redirectAttributes
			,Authentication authentication
			,@PathVariable String resHotelNo) {

		// 예약상태 예약취소로 변경
		hotelService.cancelHotelRes(resHotelNo);

		// 예약정보 가져옴
		HotelresDefaultVO res = hotelService.retrieveResInfo(resHotelNo);

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

	        HoteltimeDefaultVO currResTime = hotelTimeService.retrieveHotelTime(inputData);

	        if (date.equals(start)) {
	            currResTime.setResPm("N");
	        } else if (date.equals(end)) {
	            currResTime.setResAm("N");
	            if(res.getResHotelLateout() > 0) {
	            	currResTime.setResPm("N");
	            }
	        } else {
	            currResTime.setResAm("N");
	            currResTime.setResPm("N");
	        }

	        hotelTimeService.modifyHotelTime(currResTime);
	    }

	    // 결제정보 환불로 변경
	 	setlService.cancelHotelSetl(resHotelNo);
	 	
	 	// 지출내역 등록
	 	hotelService.createHotelResExp(resHotelNo);
	 	
		redirectAttributes.addFlashAttribute("message", "예약이 정상적으로 취소되었습니다.");

		MemberVOWrapper wrapper = (MemberVOWrapper) authentication.getPrincipal();
		MemberDefaultVO realUser = wrapper.getRealUser();
		String memNo = realUser.getMemNo();

		return "redirect:/market/member/" + memNo + "/hotelResDetail"; // 성공 후 리디렉션

	}
}
