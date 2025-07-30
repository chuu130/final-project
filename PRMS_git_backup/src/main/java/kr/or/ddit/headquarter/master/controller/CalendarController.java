package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.headquarter.employee.service.EmployeeService;
import kr.or.ddit.headquarter.master.service.CalendarService;
import kr.or.ddit.headquarter.master.service.CounselService;
import kr.or.ddit.headquarter.master.service.EducationService;
import kr.or.ddit.main.service.FoundService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.FranCalendarVO;
import kr.or.ddit.vo.def.CounselDefaultVO;
import kr.or.ddit.vo.def.EducationDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.FoundDefaultVO;

@Controller
@RequestMapping("/main/master")
public class CalendarController {

   // EducationService, FoundService, CalendarService 빈을 자동 주입
   @Autowired
   private EducationService eduservice;
   @Autowired
   private FoundService service;
   @Autowired
   private CalendarService calservice;
   @Autowired
   private CounselService couservice;
   @Autowired
	private EmployeeService empservice;

   // 캘린더 UI를 보여주는 메서드
   @GetMapping("/calendar")
   public String calendarUI() {
      // 교육 리스트 조회
      List<EducationDefaultVO> eduList = eduservice.selectEducationList();
      // 기존의 캘린더 리스트 조회
      List<CalendarVO> CalendarList = calservice.calendarList();

      // 교육 리스트를 반복문으로 캘린더 이벤트로 변환
      for(EducationDefaultVO eduVO : eduList) {
          CalendarVO calVO = new CalendarVO();

          // 교육 정보를 캘린더 이벤트로 설정
          calVO.setTitle(eduVO.getEduNm());
          calVO.setStart(eduVO.getEduDeBegin());
          calVO.setEnd(eduVO.getEduDeEnd());
          calVO.setColor("#640DF3"); // 이벤트 색상 설정
          calVO.setTextColor("#ffffff"); // 텍스트 색상 설정

          boolean shouldInsert = true;
          // 기존 캘린더 이벤트와 비교하여 중복 여부 확인
          for(CalendarVO calendarVO : CalendarList) {
              int cnt = calservice.CheckCalendar(calendarVO.getCalNo());
              if(cnt != 0) {
                  shouldInsert = false; // 중복된 경우 추가하지 않음
                  break;
              }
          }

          // 중복되지 않은 경우에만 캘린더 이벤트를 삽입
          if(shouldInsert) {
              calservice.insertCalendar(calVO);
          }
      }

      // 창업상담 정보
      List<CounselDefaultVO> couList = couservice.selectCounselList();
      for(CounselDefaultVO couVO : couList) {
              CalendarVO calVO = new CalendarVO();

              // 창업상담 정보를 캘린더 이벤트로 설정
              calVO.setTitle(couVO.getCounselCn());
              calVO.setStart(couVO.getCounselDe());
              calVO.setEnd(couVO.getCounselDe());
              calVO.setColor("#ff2d55");
              calVO.setTextColor("#ffffff");

              boolean shouldInsert = true;
              // 기존 캘린더 이벤트와 비교하여 중복 여부 확인
              for(CalendarVO calendarVO : CalendarList) {
                  int cnt = calservice.CheckCalendar(calendarVO.getCalNo());
                  if(cnt != 0) {
                      shouldInsert = false; // 중복된 경우 추가하지 않음
                      break;
                  }
              }

              // 중복되지 않은 경우에만 캘린더 이벤트를 삽입
              if(shouldInsert) {
                  calservice.insertCalendar(calVO);
              }
      }

      // 캘린더 화면을 반환
      return "master:master/calendar";
   }

   // AJAX를 통해 캘린더 데이터를 제공하는 메서드
   @GetMapping("/ajaxData")
   @ResponseBody
   public List<CalendarVO> ajaxData() {
      return calservice.calendarList();
   }

   @PostMapping("/{empId}/calendaradd")
	@ResponseBody
	public EmployeeDefaultVO add(@RequestBody CalendarVO calVO, @PathVariable String empId) {
		calVO.setColor("#5b2e91");
		calVO.setTextColor("#ffffff");
		calservice.insertCalendar(calVO);

		// @PathVariable로 받아온 프랜차이즈ID로 직원 데이터 뽑아오기
		EmployeeDefaultVO empVO = empservice.selectEmployeeFranId(empId);
		return empVO;
	}

	@GetMapping("/{empId}/calendarUpdate/{calNo}")
	public CalendarVO updatecalendarUI(@PathVariable String empId, @PathVariable int calNo) {
		CalendarVO calvo = calservice.selectcalendar(calNo);

		return calvo;
	}

	@PostMapping("/calendarUpdate")
	@ResponseBody
	public int updatecal(@RequestBody CalendarVO fcalVO) {
		int cnt = calservice.updateCalendar(fcalVO);
		return cnt;
	}

	@PostMapping("/calendarDelete/{calNo}")
	@ResponseBody
	public int deletecal(@PathVariable int calNo) {
		int cnt = calservice.deleteCalendar(calNo);
		return cnt;
	}

}