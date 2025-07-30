package kr.or.ddit.franchise.franchisee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.commons.def.mapper.CmmncodeDefaultMapper;
import kr.or.ddit.commons.def.mapper.FranchiseDefaultMapper;
import kr.or.ddit.franchise.franchisee.mapper.HotelTypeMapper;
import kr.or.ddit.franchise.franchisee.service.HotelroomCntService;
import kr.or.ddit.franchise.franchisee.service.HotelroomService;
import kr.or.ddit.headquarter.common.service.FranchiseInfoService;
import kr.or.ddit.validate.groups.InsertGroup;
import kr.or.ddit.vo.def.CmmncodeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.HotelroomDefaultVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/main/franchisee/hotelroom/insert")
public class HotelroomInsertController {
public static final String MODELNAME = "newHotelroom";

	@Autowired
	private HotelroomService service;

	@Autowired
	private HotelTypeMapper hoteldao;

	@Autowired
	private FranchiseInfoService franService;

	@ModelAttribute(MODELNAME)
	public HotelroomDefaultVO room() {
		return new HotelroomDefaultVO();
	}

	@ModelAttribute("hotelType")
	public List<CmmncodeDefaultVO> type() {
		return hoteldao.selectHotel();
	}

	@GetMapping
	public String form() {
		return "franchisee:franchisee/hotelroomForm";
	}

	@PostMapping
	public String insert(
		@Validated(InsertGroup.class) @ModelAttribute(MODELNAME) HotelroomDefaultVO newHotelroom
		, BindingResult errors
		, RedirectAttributes redirectAttributes
		, Authentication authentication
	) {
		if(!errors.hasErrors()) {
			EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
			EmployeeDefaultVO realUser = wrapper.getRealUser();
			String franchiseId = realUser.getFranchiseId();
			newHotelroom.setFranchiseId(franchiseId);

			CmmncodeDefaultVO hotelInfo =  hoteldao.selectHotelInfo(newHotelroom.getHotelNm());
			newHotelroom.setHotelType(hotelInfo.getCmmnRemark2());
			newHotelroom.setHotelPrice(Integer.parseInt(hotelInfo.getCmmnRemark3()));
			service.createHotelroom(newHotelroom);

//			franService.modifyHotelCnt(franchiseId);
			return "redirect:/main/franchisee/hotelroom";
		}else {
			redirectAttributes.addFlashAttribute(MODELNAME, newHotelroom);
			redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX+MODELNAME, errors);
			return "redirect:/main/franchisee/hotelroom/insert";
		}
//		newHotelroom.setAtchFile(null);
	}
}
