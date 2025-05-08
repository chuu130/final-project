package kr.or.ddit.headquarter.master.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.commons.paging.PaginationInfo;
import kr.or.ddit.commons.paging.PaginationInfoOrder;
import kr.or.ddit.commons.paging.PaginationRenderer;
import kr.or.ddit.commons.paging.PaginationRendererOrder;
import kr.or.ddit.commons.paging.SimpleCondition;
import kr.or.ddit.commons.paging.ThemeType2PaginationRenderer;
import kr.or.ddit.commons.paging.ThemeType2PaginationRendererOrder;
import kr.or.ddit.headquarter.master.service.OnlineOrderService;
import kr.or.ddit.vo.SearchDataVO;
import kr.or.ddit.vo.def.DeliveryDefaultVO;
import kr.or.ddit.vo.def.MemorderDefaultVO;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.Multipart;

/**
 * 온라인 회원의 주문리스트를 체크한후, 처리하는 컨트롤러
 * @author jbk
 */
@Slf4j
@Controller
@RequestMapping("/main/master/marketOrder")
public class OnlineOrderController {

	@Autowired
	private OnlineOrderService onlineOrderService;


	/**
	 * 마켓 주문현황을 체크하는 UI
	 * @return
	 */
	@GetMapping("form")
	public String marketOrderUI() {
		return "master:/master/marketOrderList";
	}


	/**
	 * 온라인 회원의 전체 주문리스트를 JSON 객체로 반환하는 메소드
	 * @param model
	 */
	@PostMapping("list")
	public void marketOrderList(
			@RequestBody SearchDataVO searchDataVO
			, Model model
	) {
		// 페이지를 셋팅한다.
		PaginationInfoOrder paging = new PaginationInfoOrder(5,5);
		paging.setPage(searchDataVO.getPage()); //페이지 셋팅
		paging.setSearchData(searchDataVO); // 검색조건 셋팅

		// 온라인 회원의 전체 주문리스트를 가져온다.
		List<MemorderDefaultVO> allMemberOrderList = onlineOrderService.retriveMemOrderList(paging);

		// 화면에 표시할 페이지 정보를 셋팅한다.
		PaginationRendererOrder rederer = new ThemeType2PaginationRendererOrder();
		String pagingHTML = rederer.renderPagination(paging);

		// 주문리스트 개수를 가져온다. (남은처리건수를 구하기위함)
		int totalCount = onlineOrderService.retriveMemOrderCount(paging);

		model.addAttribute("memberOrderList", allMemberOrderList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("totalCount",totalCount);
	}


	/**
	 * 주문번호를 통해 조회한 주문상세정보를 json데이터로 반환하는 컨트롤러
	 * @param memOrderNo
	 * @return
	 */
	@PostMapping("memOrderDt")
	public void memOrderDt(
			@RequestBody String memOrderNo
			,Model model
	) {
		log.info("주문번호 : {}", memOrderNo);

		MemorderDefaultVO memOrderDt = onlineOrderService.retrieveMemOrderDt(memOrderNo);
		model.addAttribute("memOrderDt",memOrderDt);
	}


	/**
	 * 주문번호를 통해 발송처리를 한 후, 결과를 반환하는 컨트롤러
	 * @param memOrderNo
	 * @param model
	 */
	@PostMapping("sendDlvySttus")
	public void sendDlvySttus(
			@RequestBody String memOrderNo
			, Model model
	) {
		log.info("주문번호 : {}", memOrderNo);

		boolean success = onlineOrderService.modifyDlvySttus(memOrderNo);
		model.addAttribute("success",success);
	}

}




