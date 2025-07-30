package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.franchise.franchisee.service.FranchiseService;
import kr.or.ddit.franchise.franchisee.service.StoreManageService;
import kr.or.ddit.franchise.franchisee.service.franCalendarService;
import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.market.member.service.BeautyResService;
import kr.or.ddit.vo.FranCalendarVO;
import kr.or.ddit.vo.def.BeautyresDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FranchiseDefaultVO;
import kr.or.ddit.vo.def.HotelresDefaultVO;
import kr.or.ddit.vo.def.HotelroomDefaultVO;
import kr.or.ddit.vo.def.MemberDefaultVO;
import kr.or.ddit.vo.def.PetDefaultVO;
import kr.or.ddit.vo.def.StoremanageDefaultVO;

@Controller
@RequestMapping("/main/franchise")
public class FranCalendarController {

	@Autowired
	private StoreManageService storeservice;
	@Autowired
	private EmployeeService service;
	@Autowired
	private franCalendarService fcalservice;
	@Autowired
	private FranchiseService franservice;
	@Autowired
	private BeautyResService beautyservice;

	@GetMapping("/{empId}/francalendar")
	public String calendarUI(@PathVariable String empId, Model model) {

		// @PathVariable로 받아온 프랜차이즈ID로 직원 데이터 뽑아오기
		EmployeeDefaultVO empVO = service.selectEmployeeFranId(empId);
		// 교육 리스트 조회
		List<StoremanageDefaultVO> stoList = storeservice.selectStoremanageList(empVO.getFranchiseId());
		// 기존의 캘린더 리스트 조회
		List<FranCalendarVO> franCalendarList = fcalservice.selectFranCalendarList();
		// 미용예약 리스트 조회
		List<FranchiseDefaultVO> franbeautyList = franservice.selectbeautyList(empVO.getFranchiseId());
		// 호텔예약 리스트 조회
		List<FranchiseDefaultVO> franhotelList = franservice.selecthotelList(empVO.getFranchiseId());

		// 교육 리스트를 반복문으로 캘린더 이벤트로 변환
		for (StoremanageDefaultVO stoVO : stoList) {
			FranCalendarVO francalVO = new FranCalendarVO();

			// 교육 정보를 캘린더 이벤트로 설정
			francalVO.setTitle(stoVO.getStoremanageResn());
			francalVO.setStart(stoVO.getStoremanageDe());
			francalVO.setEnd(stoVO.getStoremanageDe());
			francalVO.setColor("#ff2d55");
			francalVO.setTextColor("#ffffff");
			francalVO.setFranchiseId(empVO.getFranchiseId());

			boolean shouldInsert = true;
			// 기존 캘린더 이벤트와 비교하여 중복 여부 확인
			for (FranCalendarVO francalenVO : franCalendarList) {
				int cnt = fcalservice.checkFcalendar(francalenVO.getCalNo());
				if (cnt != 0) {
					shouldInsert = false; // 중복된 경우 추가하지 않음
					break;
				}
			}

			// 중복되지 않은 경우에만 캘린더 이벤트를 삽입
			if (shouldInsert) {
				fcalservice.insertFranCalendar(francalVO);
			}
		}

		// 호텔예약 리스트를 반복문으로 캘린더 이벤트로 변환
		for (FranchiseDefaultVO franvo : franhotelList) {

			for (HotelroomDefaultVO hrVO : franvo.getHotelroomList()) {

				for (HotelresDefaultVO hotelresVO : hrVO.getHotelresList()) {

					for (PetDefaultVO petVO : hotelresVO.getPetList()) {

						for (MemberDefaultVO memVO : petVO.getMemList()) {

							FranCalendarVO francalVO = new FranCalendarVO();

							// 교육 정보를 캘린더 이벤트로 설정
							francalVO.setTitle(memVO.getMemNm() + "님 " + hrVO.getHotelNm() + "방 예약");
							francalVO.setStart(hotelresVO.getResHotelRegistDe());
							francalVO.setEnd(hotelresVO.getResHotelRegistDe());
							francalVO.setColor("#FFCC00");
							francalVO.setTextColor("#ffffff");
							francalVO.setFranchiseId(empVO.getFranchiseId());

							boolean shouldInsert = true;
							// 기존 캘린더 이벤트와 비교하여 중복 여부 확인
							for (FranCalendarVO francalenVO : franCalendarList) {
								int cnt = fcalservice.checkFcalendar(francalenVO.getCalNo());
								if (cnt != 0) {
									shouldInsert = false; // 중복된 경우 추가하지 않음
									break;
								}
							}

							// 중복되지 않은 경우에만 캘린더 이벤트를 삽입
							if (shouldInsert) {
								fcalservice.insertFranCalendar(francalVO);
							}

						}

					}

				}
			}
		}

		// 미용예약 리스트를 반복문으로 캘린더 이벤트로 변환
		for (FranchiseDefaultVO franchisevo : franbeautyList) {
			// FranchiseDefaultVO 내의 BeautyresDefaultVO 리스트를 반복
			for (BeautyresDefaultVO beautyRes : franchisevo.getBeautyresList()) {

				for (PetDefaultVO petVO : beautyRes.getPetList()) {

					for (MemberDefaultVO memVO : petVO.getMemList()) {

						FranCalendarVO francalVO = new FranCalendarVO();

						// 미용 예약 정보를 캘린더 이벤트로 설정
						francalVO.setTitle(memVO.getMemNm()+"님 "+beautyRes.getResOption() + " 미용예약");
						francalVO.setStart(beautyRes.getResBeautyRegistDe());
						francalVO.setEnd(beautyRes.getResBeautyRegistDe());
						francalVO.setColor("#FF9500");
						francalVO.setTextColor("#ffffff");
						francalVO.setFranchiseId(empVO.getFranchiseId());

						boolean shouldInsert = true;
						// 기존 캘린더 이벤트와 비교하여 중복 여부 확인
						for (FranCalendarVO francalenVO : franCalendarList) {
							int cnt = fcalservice.checkFcalendar(francalenVO.getCalNo());
							if (cnt != 0) {
								shouldInsert = false; // 중복된 경우 추가하지 않음
								break;
							}
						}

						// 중복되지 않은 경우에만 캘린더 이벤트를 삽입
						if (shouldInsert) {
							fcalservice.insertFranCalendar(francalVO);
						}
					}
				}
			}
		}

		List<FranCalendarVO> franCalList = fcalservice.selectFranCalendarList();
		model.addAttribute("francalendarList", franCalList);


		// 캘린더 화면을 반환
		return "franchisee:franchisee/francalendar";
	}

	@GetMapping("ajaxData/{empId}")
	@ResponseBody
	public List<FranCalendarVO> ajaxData(@PathVariable String empId) {
		// 해당 프랜차이즈 값 가져오기
		EmployeeDefaultVO empVO = service.selectEmployeeFranId(empId);
		// 해당 프랜차이즈의 캘린더 이벤트 리스트를 반환
		return fcalservice.selectFranCalendarListed(empVO.getFranchiseId());
	}

	@PostMapping("{empId}/calendaradd")
	@ResponseBody
	public EmployeeDefaultVO add(@RequestBody FranCalendarVO fcalVO, @PathVariable String empId) {
		fcalVO.setColor("#5b2e91");
		fcalVO.setTextColor("#ffffff");
		fcalVO.setFranchiseId("1001");
		fcalservice.insertFranCalendar(fcalVO);

		// @PathVariable로 받아온 프랜차이즈ID로 직원 데이터 뽑아오기
		EmployeeDefaultVO empVO = service.selectEmployeeFranId(empId);
		return empVO;
	}

	@GetMapping("{empId}/calendarUpdate/{calNo}")
	public FranCalendarVO updatecalendarUI(@PathVariable String empId, @PathVariable int calNo) {
		FranCalendarVO francalvo = fcalservice.selectFrancalendar(calNo);

		return francalvo;
	}

	@PostMapping("calendarUpdate")
	@ResponseBody
	public int updatecal(@RequestBody FranCalendarVO fcalVO) {
		int cnt = fcalservice.updatefrancal(fcalVO);
		return cnt;
	}

	@PostMapping("calendarDelete/{calNo}")
	@ResponseBody
	public int deletecal(@PathVariable int calNo) {
		int cnt = fcalservice.deletefrancal(calNo);
		return cnt;
	}
}