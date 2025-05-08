package kr.or.ddit.franchise.franchisee.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.RetailPaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.franchise.franchisee.service.HotelroomService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.HotelroomDefaultVO;

@Controller
@RequestMapping("/main/franchisee/hotelroom")
public class HotelroomRetrieveController {

	@Autowired
	private HotelroomService service;

	@GetMapping
	public String list(@RequestParam(required = false, defaultValue = "1") int page
			, @ModelAttribute("condition") SimpleCondition simpleCondition
			, Model model
			, Authentication authentication
	) {
		PaginationInfo paging = new PaginationInfo(5,5);
		paging.setPage(page);
		paging.setSimpleCondition(simpleCondition);

		EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
		EmployeeDefaultVO realUser = wrapper.getRealUser();
		HashMap<String, Object> inputData = new HashMap<String, Object>();

		inputData.put("paging", paging);
		inputData.put("franchiseId", realUser.getFranchiseId());

		List<HotelroomDefaultVO> list = service.retrieveHotelroomList(inputData);
		model.addAttribute("hotelroomList", list);

		PaginationRenderer renderer = new RetailPaginationRenderer();
		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("hash", "hotelroom");

		return "franchisee:franchisee/hotelroomList";
	}

	@GetMapping("{hotelId}")
	public String detail(@PathVariable String hotelId, Model model){
		HotelroomDefaultVO hotelroom = service.retrieveHotelroom(hotelId);
		model.addAttribute("room", hotelroom);

//		DecimalFormat df = new DecimalFormat("###,###원");
//		String formatMoney = df.format(money);

		return "franchisee:franchisee/hotelroomDetail";
	}

}
