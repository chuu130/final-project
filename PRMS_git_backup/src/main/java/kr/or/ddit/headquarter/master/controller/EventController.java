package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.EventListService;
import kr.or.ddit.vo.def.EventDefaultVO;

@Controller
@RequestMapping("/main/master")
public class EventController {

	@Autowired
	private EventListService service;

	@GetMapping("/eventList.do")
	public String EventList(Model model) {
		List<EventDefaultVO> list = service.selectAll();
		model.addAttribute("eventList", list);

		return "master:master/eventList";
	}

@PostMapping("eventListAll.do")
public String EventListAll(Model model) {
	List<EventDefaultVO> list  = service.selectAll();
	model.addAttribute("eventListAll",list);
	return "mster: master/eventListAll";
}
}