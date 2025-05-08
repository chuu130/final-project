package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.commons.paging.PaginationRendererOrder;
import kr.or.ddit.commons.paging.ThemeType2PaginationRendererOrder;
import kr.or.ddit.headquarter.master.service.FranOrderService;
import kr.or.ddit.vo.SearchDataVO;
import kr.or.ddit.vo.def.InvrequestDefaultVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 가맹점 발주상품을 처리하는 컨트롤러
 * @author jbk
 */
@Slf4j
@Controller
@RequestMapping("/main/master/franOrder")
public class FranOrderController {

	@Autowired
	private FranOrderService franOrderService;

	/**
	 * 가맹점 발주현황을 체크하는 UI
	 * @return
	 */
	@GetMapping("form")
	public String franOrderUI() {
		return "master:/master/franOrderList";
	}


	/**
	 * 가맹점 발주리스트를 JSON 객체로 반환하는 메소드
	 * @param searchDataVO
	 * @param model
	 */
	@PostMapping("list")
	public void franOrderList(
			@RequestBody SearchDataVO searchDataVO
			, Model model
	) {
		log.info("검색데이터 : {}", searchDataVO);

		// 페이지를 셋팅한다.
		PaginationInfoOrder paging = new PaginationInfoOrder(5,5);
		paging.setPage(searchDataVO.getPage());
		paging.setSearchData(searchDataVO);

		// 발주리스트를 가져온다.
		List<InvrequestDefaultVO> franOrderList = franOrderService.retrieveFranOrderList(paging);

		// 화면에 표시할 페이지 정보를 셋팅한다.
		PaginationRendererOrder renderer = new ThemeType2PaginationRendererOrder();
		String pagingHTML = renderer.renderPagination(paging);

		// 발주건수를 조회한다.
		int totalCount = franOrderService.retrieveFranOrderCount(paging);

		// JSON 객체로 전송한다.
		model.addAttribute("franOrderList",franOrderList);
		model.addAttribute("pagingHTML",pagingHTML);
		model.addAttribute("totalCount",totalCount);
	}


	/**
	 * 발주번호를 통해 조회한 발주상세정보를 JSON 데이터로 반환하는 컨트롤러
	 * @param franOrderNo
	 * @param model
	 */
	@PostMapping("franOrderDt")
	public void franOrderDt(
			@RequestBody String franOrderNo
			,Model model
	) {
		log.info("발주번호 : {}", franOrderNo);
		InvrequestDefaultVO franOrderDt = franOrderService.retrieveFranOrderDt(franOrderNo);
		model.addAttribute("franOrderDt",franOrderDt);
	}


	/**
	 * 발주번호를 통해 가맹점과 본사의 재고를 변경한 후, 결과값을 반환하는 메소드
	 * @param franOrderNo
	 */
	@PostMapping("sendInvReqeustStatus")
	public void sendInvReqeustStatus(
		@RequestBody String franOrderNo
		,Model model
	) {
		log.info("발주번호 : {}", franOrderNo);

		boolean success = false;

		try {
			franOrderService.modifyInvFranAndHead(franOrderNo);
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("success", success);
	}


	@PostMapping("rejectInvRequest")
	public void rejectInvRequest(
		@RequestBody InvrequestDefaultVO invRequest
		,Model model
	) {
		log.info("발주번호 : {}", invRequest.getFireqId());
		log.info("반려사유 : {}", invRequest.getFireqRejCn());

		boolean success = false;

		try {
			franOrderService.modifyInvAndMoneyToFranAndHead(invRequest);
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("success", success);
	}

}
