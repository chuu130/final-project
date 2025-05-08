package kr.or.ddit.franchise.franchisee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.RetailPaginationRenderer;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.market.member.service.HotelResService;
import kr.or.ddit.vo.def.EmployeeDefaultVO;
import kr.or.ddit.vo.def.EmployeeDefaultVOWrapper;
import kr.or.ddit.vo.def.HotelresDefaultVO;

@Controller
@RequestMapping("/main/franchisee/hotelRes")
public class HotelResStatus {

	@Autowired
	HotelResService service;

	@GetMapping
	public String list() {
		return "franchisee:franchisee/hotelResList";
	}

    @GetMapping("/tab")
    public ResponseEntity<Map<String, Object>> tabList(
    			@RequestParam(required = false, defaultValue = "1") int page,
    			@RequestParam(required = false, defaultValue = "allTab") String tab,
    			@ModelAttribute("condition") SimpleCondition simpleCondition,
                Authentication authentication) {

    	System.out.println(page);
    	System.out.println(tab);
    	PaginationInfo paging = new PaginationInfo(10, 5);
        paging.setPage(page);
        paging.setSimpleCondition(simpleCondition);

        EmployeeDefaultVOWrapper wrapper = (EmployeeDefaultVOWrapper) authentication.getPrincipal();
        EmployeeDefaultVO realUser = wrapper.getRealUser();
        HashMap<String, Object> inputData = new HashMap<>();
        inputData.put("paging", paging);
        inputData.put("franchiseId", realUser.getFranchiseId());

        List<HotelresDefaultVO> list;
        switch (tab) {
            case "allTab":
                list = service.retrieveResListByFran(inputData);
                break;
            case "completed":
                list = service.retrieveResListByFran1(inputData);
                break;
            case "used":
                list = service.retrieveResListByFran2(inputData);
                break;
            case "canceled":
                list = service.retrieveResListByFran3(inputData);
                break;
            default:
                throw new IllegalArgumentException("Invalid list method: " + tab);
        }

        PaginationRenderer renderer = new RetailPaginationRenderer();
        String pagingHTML = renderer.renderPagination(paging);

        Map<String, Object> response = new HashMap<String, Object>();
        response.put("resList", list);
        response.put("pagingHTML", pagingHTML);

        return ResponseEntity.ok(response);
    }

	@GetMapping("/detail")
	public String detail(@RequestParam("resHotelNo") String resHotelNo, Model model) {

		HotelresDefaultVO resDetail = service.retrieveResInfoDetail(resHotelNo);

		 model.addAttribute("resDetail", resDetail);

		 return "franchisee/hotelResDetailModal";
	}
}
