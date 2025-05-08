package kr.or.ddit.headquarter.master.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.headquarter.master.service.CalendarService;
import kr.or.ddit.vo.CalendarVO;

@RestController
@RequestMapping("/events")
public class calendartest {

	@Autowired
	private CalendarService service;

    @PostMapping("/add")
    public ResponseEntity<String> addEvent(@RequestBody CalendarVO calVO) {
        // 서비스 레이어를 통해 이벤트 저장 로직 구현
        // 예: eventService.save(eventDto);
    	service.insertCalendar(calVO);
        return ResponseEntity.ok("Event added successfully");
    }

    @PostMapping("/update")
    public ResponseEntity<String> updateEvent(@RequestBody CalendarVO eventDto) {
        // 서비스 레이어를 통해 이벤트 수정 로직 구현
        // 예: eventService.update(eventDto);
        return ResponseEntity.ok("Event updated successfully");
    }
}
