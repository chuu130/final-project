package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.franchise.franchisee.mapper.HotelTypeMapper;
import kr.or.ddit.franchise.franchisee.service.HotelroomService;
import kr.or.ddit.validate.groups.UpdateGroup;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.HotelroomDefaultVO;

@Controller
@RequestMapping("/main/franchisee/hotelroom")
public class HotelroomModifyController {
	@Autowired
	private HotelroomService service;

	@Autowired
	private HotelTypeMapper hoteldao;

//	@ModelAttribute("room")
//	public HotelroomDefaultVO hotelroom() {
//		return new HotelroomDefaultVO();
//	}

	@ModelAttribute("hotelType")
	public List<CmmncodeDefaultVO> type() {
		return hoteldao.selectHotel();
	}

	@GetMapping("{hotelId}/update")
	public String form(@PathVariable String hotelId, Model model) {
		if(!model.containsAttribute("room")) {
			HotelroomDefaultVO hotelroom = service.retrieveHotelroom(hotelId);
			model.addAttribute("room", hotelroom);
		}
		return "franchisee:franchisee/hotelroomEdit";
	}

	@PostMapping("{hotelId}/update")
	public String update(
			@Validated(UpdateGroup.class) @ModelAttribute("room") HotelroomDefaultVO hotelroom
			, BindingResult errors
			, RedirectAttributes redirectAttributes) {

		if(!errors.hasErrors()) {
			CmmncodeDefaultVO hotelInfo =  hoteldao.selectHotelInfo(hotelroom.getHotelNm());
			hotelroom.setHotelType(hotelInfo.getCmmnRemark2());
			hotelroom.setHotelPrice(Integer.parseInt(hotelInfo.getCmmnRemark3()));

			service.modifyHotelroom(hotelroom);
			redirectAttributes.addFlashAttribute("message", "정상적으로 수정되었습니다.");
			return "redirect:/main/franchisee/hotelroom/{hotelId}";
		}else {
			redirectAttributes.addFlashAttribute("hotelroom", hotelroom);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX, errors);
			return "redirect:/main/franchisee/hotelroom/{hotelId}/update";
		}
	}

	@PostMapping("{hotelId}/delete")
	public String delete(@PathVariable String hotelId, RedirectAttributes redirectAttributes) {
		service.deleteHotelroom(hotelId);
		redirectAttributes.addFlashAttribute("message", "정상적으로 삭제되었습니다.");
		return "redirect:/main/franchisee/hotelroom";
	}
}
