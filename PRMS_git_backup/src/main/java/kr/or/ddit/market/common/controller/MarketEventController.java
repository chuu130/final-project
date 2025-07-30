package kr.or.ddit.market.common.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.headquarter.master.service.CouponService;
import kr.or.ddit.market.common.service.EventService;
import kr.or.ddit.vo.def.CouponDefaultVO;
import kr.or.ddit.vo.def.EventDefaultVO;

@Controller
@RequestMapping("/market/event")
public class MarketEventController {

	@Autowired
	private EventService service;
	@Autowired
	private CouponService couponservice;

	@GetMapping("/eventList")
	public String formUI(EventDefaultVO eventboard,
						 Model model) {
		List<EventDefaultVO> eventList = service.selectAllEvent();
		List<CouponDefaultVO> couponList = couponservice.selectAll();
		model.addAttribute("eventList", eventList);
		model.addAttribute("couponList",couponList);
		return "market:market/marketEventList";

	}


}
